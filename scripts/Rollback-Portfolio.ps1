[CmdletBinding()]
param(
  [string]$DeployRoot = 'C:\web\portfolio',
  [string]$HealthUrl = 'http://127.0.0.1:8080'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$deployRootFull = [IO.Path]::GetFullPath($DeployRoot).TrimEnd('\')
$deployPrefix = $deployRootFull + [IO.Path]::DirectorySeparatorChar
$currentPath = Join-Path $deployRootFull 'current'
$previousPath = Join-Path $deployRootFull 'previous'
$temporaryPath = Join-Path $deployRootFull ('.rollback-' + (Get-Date -Format 'yyyyMMddHHmmss'))
$lockPath = Join-Path $deployRootFull '.deploy.lock'

function Assert-ManagedPath {
  param([Parameter(Mandatory)][string]$Path)

  $fullPath = [IO.Path]::GetFullPath($Path).TrimEnd('\')
  if (-not $fullPath.StartsWith($deployPrefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to move a path outside $deployRootFull`: $fullPath"
  }
  return $fullPath
}

function Move-ManagedDirectory {
  param(
    [Parameter(Mandatory)][string]$Source,
    [Parameter(Mandatory)][string]$Destination
  )

  $sourceFull = Assert-ManagedPath $Source
  $destinationFull = Assert-ManagedPath $Destination
  if (-not (Test-Path -LiteralPath $sourceFull -PathType Container)) {
    throw "Rollback source is missing: $sourceFull"
  }
  if (Test-Path -LiteralPath $destinationFull) {
    throw "Rollback destination already exists: $destinationFull"
  }
  [IO.Directory]::Move($sourceFull, $destinationFull)
}

function Assert-Health {
  $base = $HealthUrl.TrimEnd('/')
  foreach ($path in @('/', '/work/', '/resume/')) {
    $response = Invoke-WebRequest -Uri ($base + $path) -UseBasicParsing -TimeoutSec 10
    if ([int]$response.StatusCode -ne 200) {
      throw "Rollback health check returned HTTP $($response.StatusCode) for $path"
    }
  }
}

if (-not (Test-Path -LiteralPath $currentPath -PathType Container)) {
  throw 'The current deployment directory is missing.'
}
if (-not (Test-Path -LiteralPath $previousPath -PathType Container)) {
  throw 'No previous deployment is available for rollback.'
}

$lock = $null
try {
  $lock = [IO.File]::Open(
    $lockPath,
    [IO.FileMode]::OpenOrCreate,
    [IO.FileAccess]::ReadWrite,
    [IO.FileShare]::None
  )

  Move-ManagedDirectory $currentPath $temporaryPath
  Move-ManagedDirectory $previousPath $currentPath

  try {
    Assert-Health
  } catch {
    $healthError = $_
    Move-ManagedDirectory $currentPath $previousPath
    Move-ManagedDirectory $temporaryPath $currentPath
    throw "Rollback health check failed; original current release was restored. $($healthError.Exception.Message)"
  }

  Move-ManagedDirectory $temporaryPath $previousPath
  Write-Output 'Rollback succeeded; current and previous releases were swapped.'
} finally {
  if ($lock) {
    $lock.Dispose()
  }
}
