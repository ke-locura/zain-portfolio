[CmdletBinding()]
param(
  [string]$Owner = 'ke-locura',
  [string]$Repository = 'zain-portfolio',
  [string]$RunnerName = 'ZAIN-EliteBook'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  throw 'Run this script from an elevated PowerShell window.'
}

$runnerRoot = 'C:\actions-runner'
$configCommand = Join-Path $runnerRoot 'config.cmd'
if (-not (Test-Path -LiteralPath $configCommand -PathType Leaf)) {
  throw "GitHub Actions runner is not staged at $runnerRoot"
}
if (Test-Path -LiteralPath (Join-Path $runnerRoot '.runner')) {
  throw 'This runner directory is already registered. Refusing to replace it automatically.'
}

$ghCommand = Get-Command gh -ErrorAction SilentlyContinue
if (-not $ghCommand) {
  $ghCommand = Get-ChildItem -LiteralPath "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter gh.exe |
    Where-Object FullName -Match 'GitHub\.cli_' |
    Select-Object -First 1
}
if (-not $ghCommand) {
  throw 'GitHub CLI is not installed.'
}
$ghPath = if ($ghCommand -is [System.Management.Automation.ApplicationInfo]) {
  $ghCommand.Source
} else {
  $ghCommand.FullName
}

& $ghPath auth status --hostname github.com
if ($LASTEXITCODE -ne 0) {
  throw 'GitHub CLI is not authenticated.'
}

$repoName = "$Owner/$Repository"
$repoView = (& $ghPath repo view $repoName --json nameWithOwner,url 2>$null | Out-String).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoView)) {
  throw "GitHub repository $repoName does not exist or is not accessible."
}

$registrationToken = (& $ghPath api -X POST "repos/$Owner/$Repository/actions/runners/registration-token" --jq '.token' | Out-String).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($registrationToken)) {
  throw 'Could not obtain a temporary runner registration token.'
}

$currentUserSid = [Security.Principal.WindowsIdentity]::GetCurrent().User.Value
& icacls.exe $runnerRoot /inheritance:r | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not disable inherited permissions on the runner directory.' }
& icacls.exe $runnerRoot /grant:r `
  "*${currentUserSid}:(OI)(CI)F" `
  '*S-1-5-18:(OI)(CI)F' `
  '*S-1-5-32-544:(OI)(CI)F' `
  '*S-1-5-20:(OI)(CI)M' | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not secure the runner installation directory.' }

$portfolioRoot = 'C:\web\portfolio'
& icacls.exe $portfolioRoot /grant:r `
  "*${currentUserSid}:(OI)(CI)F" `
  '*S-1-5-18:(OI)(CI)F' `
  '*S-1-5-32-544:(OI)(CI)F' `
  '*S-1-5-19:(OI)(CI)RX' `
  '*S-1-5-20:(OI)(CI)M' | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not secure the deployment directory for the runner and Caddy services.' }

& $configCommand `
  --unattended `
  --url "https://github.com/$repoName" `
  --token $registrationToken `
  --name $RunnerName `
  --labels 'portfolio' `
  --work '_work' `
  --runasservice
$registrationToken = $null
if ($LASTEXITCODE -ne 0) {
  throw 'GitHub runner registration failed.'
}

$runnerService = Get-Service | Where-Object Name -Like 'actions.runner.*' | Select-Object -First 1
if (-not $runnerService) {
  throw 'Runner registration completed but its Windows service was not found.'
}
if ($runnerService.Status -ne 'Running') {
  Start-Service -Name $runnerService.Name
}
Set-Service -Name $runnerService.Name -StartupType Automatic

$archive = Join-Path $runnerRoot 'actions-runner-2.337.0.zip'
if (Test-Path -LiteralPath $archive -PathType Leaf) {
  Remove-Item -LiteralPath $archive -Force
}

Get-Service -Name $runnerService.Name | Select-Object Name, Status, StartType
