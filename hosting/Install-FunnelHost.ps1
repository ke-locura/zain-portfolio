[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  throw 'Run this script from an elevated PowerShell window.'
}

$hostRoot = 'C:\web'
$logRoot = Join-Path $hostRoot 'setup'
New-Item -ItemType Directory -Force -Path $logRoot | Out-Null
$transcriptPath = Join-Path $logRoot 'install-funnel-host.log'

Start-Transcript -LiteralPath $transcriptPath -Force | Out-Null
try {
  & (Join-Path $PSScriptRoot 'Install-WindowsHost.ps1')

  $tailscaleExe = 'C:\Program Files\Tailscale\tailscale.exe'
  if (-not (Test-Path -LiteralPath $tailscaleExe -PathType Leaf)) {
    $wingetCommand = Get-Command winget.exe -ErrorAction Stop
    & $wingetCommand.Source install --id Tailscale.Tailscale --exact --scope machine --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
    if ($LASTEXITCODE -ne 0) {
      throw "Tailscale installation failed with exit code $LASTEXITCODE."
    }
  }

  if (-not (Test-Path -LiteralPath $tailscaleExe -PathType Leaf)) {
    throw "The Tailscale CLI was not found at $tailscaleExe after installation."
  }

  $tailscaleService = Get-Service -Name 'Tailscale' -ErrorAction Stop
  Set-Service -Name $tailscaleService.Name -StartupType Automatic
  if ($tailscaleService.Status -ne 'Running') {
    Start-Service -Name $tailscaleService.Name
  }

  & $tailscaleExe version
  if ($LASTEXITCODE -ne 0) { throw 'The Tailscale CLI did not run successfully.' }

  Get-Service -Name 'CaddyPortfolio','Tailscale' |
    Select-Object Name, Status, StartType
} finally {
  Stop-Transcript | Out-Null
}
