[CmdletBinding()]
param(
  [string]$BuildPath,
  [string]$DeployRoot = 'C:\web\portfolio',
  [string]$ReleaseId,
  [string]$HealthUrl = 'http://127.0.0.1:8080',
  [switch]$SkipHttpCheck
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($BuildPath)) {
  $BuildPath = Join-Path (Split-Path $PSScriptRoot -Parent) 'build'
}

if ([string]::IsNullOrWhiteSpace($ReleaseId)) {
  $shortCommit = (& git rev-parse --short HEAD 2>$null | Out-String).Trim()
  if ([string]::IsNullOrWhiteSpace($shortCommit)) {
    $shortCommit = 'manual'
  }
  $ReleaseId = '{0}-{1}' -f (Get-Date -Format 'yyyyMMddHHmmss'), $shortCommit
}

if ($ReleaseId -notmatch '^[A-Za-z0-9._-]+$') {
  throw 'ReleaseId may contain only letters, numbers, periods, underscores, and hyphens.'
}

$buildRoot = [IO.Path]::GetFullPath($BuildPath).TrimEnd('\')
$deployRootFull = [IO.Path]::GetFullPath($DeployRoot).TrimEnd('\')
$deployPrefix = $deployRootFull + [IO.Path]::DirectorySeparatorChar

if (-not (Test-Path -LiteralPath $buildRoot -PathType Container)) {
  throw "Static build directory is missing: $buildRoot"
}

function Assert-ManagedPath {
  param([Parameter(Mandatory)][string]$Path)

  $fullPath = [IO.Path]::GetFullPath($Path).TrimEnd('\')
  if (-not $fullPath.StartsWith($deployPrefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to modify a path outside $deployRootFull`: $fullPath"
  }
  return $fullPath
}

function Remove-ManagedDirectory {
  param([Parameter(Mandatory)][string]$Path)

  $fullPath = Assert-ManagedPath $Path
  if (-not (Test-Path -LiteralPath $fullPath)) {
    return
  }

  for ($attempt = 1; $attempt -le 5; $attempt++) {
    try {
      Remove-Item -LiteralPath $fullPath -Recurse -Force -ErrorAction Stop
      return
    } catch {
      if ($attempt -eq 5) { throw }
      Start-Sleep -Milliseconds (250 * $attempt)
    }
  }
}

function Move-ManagedDirectory {
  param(
    [Parameter(Mandatory)][string]$Source,
    [Parameter(Mandatory)][string]$Destination
  )

  $sourceFull = Assert-ManagedPath $Source
  $destinationFull = Assert-ManagedPath $Destination

  if (-not (Test-Path -LiteralPath $sourceFull -PathType Container)) {
    throw "Directory to move does not exist: $sourceFull"
  }
  if (Test-Path -LiteralPath $destinationFull) {
    throw "Move destination already exists: $destinationFull"
  }

  for ($attempt = 1; $attempt -le 8; $attempt++) {
    try {
      [IO.Directory]::Move($sourceFull, $destinationFull)
      return
    } catch {
      if ($attempt -eq 8) { throw }
      Start-Sleep -Milliseconds (250 * $attempt)
    }
  }
}

function Copy-Tree {
  param(
    [Parameter(Mandatory)][string]$Source,
    [Parameter(Mandatory)][string]$Destination
  )

  $sourceFull = [IO.Path]::GetFullPath($Source).TrimEnd('\')
  $destinationFull = Assert-ManagedPath $Destination

  if (-not (Test-Path -LiteralPath $sourceFull -PathType Container)) {
    throw "Copy source does not exist: $sourceFull"
  }

  Remove-ManagedDirectory $destinationFull
  New-Item -ItemType Directory -Force -Path $destinationFull | Out-Null

  & robocopy.exe $sourceFull $destinationFull /E /COPY:DAT /DCOPY:DAT /R:3 /W:1 /XJ /NFL /NDL /NJH /NJS /NP
  $copyExit = $LASTEXITCODE
  $global:LASTEXITCODE = 0
  if ($copyExit -ge 8) {
    throw "Robocopy failed with exit code $copyExit."
  }
}

function Assert-Release {
  param([Parameter(Mandatory)][string]$Root)

  $requiredRoutes = @('', 'work', 'web', 'lab', 'about', 'contact', 'resume')
  foreach ($route in $requiredRoutes) {
    $routeFile = if ([string]::IsNullOrWhiteSpace($route)) {
      Join-Path $Root 'index.html'
    } else {
      Join-Path $Root ($route + '\index.html')
    }

    if (-not (Test-Path -LiteralPath $routeFile -PathType Leaf)) {
      throw "Generated route is missing: /$route"
    }
  }

  foreach ($asset in @('_app', 'zain.png', 'resume.pdf')) {
    if (-not (Test-Path -LiteralPath (Join-Path $Root $asset))) {
      throw "Required generated asset is missing: $asset"
    }
  }

  $workRoot = Join-Path $Root 'work'
  $slugs = @(
    Get-ChildItem -LiteralPath $workRoot -Directory |
      Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'index.html') -PathType Leaf } |
      Select-Object -ExpandProperty Name |
      Sort-Object -Unique
  )

  if ($slugs.Count -eq 0) {
    throw 'No generated case-study pages were found.'
  }

  return $slugs
}

function Assert-HttpHealth {
  param(
    [Parameter(Mandatory)][string]$BaseUrl,
    [Parameter(Mandatory)][string[]]$Slugs
  )

  $base = $BaseUrl.TrimEnd('/')
  $paths = @('/', '/work/', '/web/', '/lab/', '/about/', '/contact/', '/resume/')
  $paths += @($Slugs | ForEach-Object { '/work/' + $_ + '/' })
  $paths += @('/zain.png', '/resume.pdf')

  foreach ($path in $paths) {
    $lastError = $null
    for ($attempt = 1; $attempt -le 8; $attempt++) {
      try {
        $response = Invoke-WebRequest -Uri ($base + $path) -UseBasicParsing -TimeoutSec 10
        if ([int]$response.StatusCode -eq 200) {
          $lastError = $null
          break
        }
        $lastError = "HTTP $($response.StatusCode)"
      } catch {
        $lastError = $_.Exception.Message
      }
      Start-Sleep -Seconds 1
    }

    if ($lastError) {
      throw "Health check failed for $path`: $lastError"
    }
  }
}

New-Item -ItemType Directory -Force -Path $deployRootFull | Out-Null
$releasesRoot = Join-Path $deployRootFull 'releases'
New-Item -ItemType Directory -Force -Path $releasesRoot | Out-Null

$releasePath = Join-Path $releasesRoot $ReleaseId
$currentPath = Join-Path $deployRootFull 'current'
$previousPath = Join-Path $deployRootFull 'previous'
$nextPath = Join-Path $deployRootFull ('.current-' + $ReleaseId)
$stalePreviousPath = Join-Path $deployRootFull ('.previous-' + $ReleaseId)
$failedPath = Join-Path $deployRootFull ('.failed-' + $ReleaseId)
$lockPath = Join-Path $deployRootFull '.deploy.lock'

$lock = $null
try {
  $lock = [IO.File]::Open(
    $lockPath,
    [IO.FileMode]::OpenOrCreate,
    [IO.FileAccess]::ReadWrite,
    [IO.FileShare]::None
  )

  if (Test-Path -LiteralPath $releasePath) {
    throw "Release already exists: $releasePath"
  }

  Copy-Tree $buildRoot $releasePath
  $caseSlugs = @(Assert-Release $releasePath)
  Copy-Tree $releasePath $nextPath
  [void](Assert-Release $nextPath)

  Remove-ManagedDirectory $stalePreviousPath
  Remove-ManagedDirectory $failedPath

  $previousArchived = $false
  $currentBackedUp = $false
  $newActivated = $false

  try {
    if (Test-Path -LiteralPath $previousPath) {
      Move-ManagedDirectory $previousPath $stalePreviousPath
      $previousArchived = $true
    }

    if (Test-Path -LiteralPath $currentPath) {
      Move-ManagedDirectory $currentPath $previousPath
      $currentBackedUp = $true
    }

    Move-ManagedDirectory $nextPath $currentPath
    $newActivated = $true

    if (-not $SkipHttpCheck) {
      Assert-HttpHealth $HealthUrl $caseSlugs
    }
  } catch {
    $deploymentError = $_

    if ($newActivated -and (Test-Path -LiteralPath $currentPath)) {
      Move-ManagedDirectory $currentPath $failedPath
    }
    if ($currentBackedUp -and (Test-Path -LiteralPath $previousPath)) {
      Move-ManagedDirectory $previousPath $currentPath
    }
    if ($previousArchived -and (Test-Path -LiteralPath $stalePreviousPath)) {
      Move-ManagedDirectory $stalePreviousPath $previousPath
    }

    Remove-ManagedDirectory $nextPath
    Remove-ManagedDirectory $failedPath

    if ($currentBackedUp -and -not $SkipHttpCheck) {
      Assert-HttpHealth $HealthUrl @()
    }

    throw "Deployment failed; the previous site was restored. $($deploymentError.Exception.Message)"
  }

  Remove-ManagedDirectory $stalePreviousPath

  Get-ChildItem -LiteralPath $releasesRoot -Directory |
    Sort-Object LastWriteTimeUtc -Descending |
    Select-Object -Skip 5 |
    ForEach-Object { Remove-ManagedDirectory $_.FullName }

  Write-Output "Deployed release $ReleaseId with $($caseSlugs.Count) case-study pages."
} finally {
  if ($lock) {
    $lock.Dispose()
  }
  $global:LASTEXITCODE = 0
}
