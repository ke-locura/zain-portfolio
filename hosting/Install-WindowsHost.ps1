[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  throw 'Run this script from an elevated PowerShell window.'
}

$repoRoot = Split-Path $PSScriptRoot -Parent
$hostRoot = 'C:\web'
$caddyRoot = Join-Path $hostRoot 'caddy'
$caddyExe = Join-Path $caddyRoot 'caddy.exe'
$serviceExe = Join-Path $caddyRoot 'caddy-service.exe'
$caddyfile = Join-Path $caddyRoot 'Caddyfile'
$serviceConfig = Join-Path $caddyRoot 'caddy-service.xml'

foreach ($path in @(
  $hostRoot,
  (Join-Path $hostRoot 'portfolio'),
  (Join-Path $hostRoot 'portfolio\releases'),
  $caddyRoot,
  (Join-Path $caddyRoot 'logs'),
  (Join-Path $caddyRoot 'state')
)) {
  New-Item -ItemType Directory -Force -Path $path | Out-Null
}

if (-not (Test-Path -LiteralPath $caddyExe -PathType Leaf)) {
  throw "Caddy is not staged at $caddyExe"
}
if (-not (Test-Path -LiteralPath $serviceExe -PathType Leaf)) {
  throw "WinSW is not staged at $serviceExe"
}

Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'Caddyfile') -Destination $caddyfile -Force
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'caddy-service.xml') -Destination $serviceConfig -Force

powercfg /change standby-timeout-ac 0
if ($LASTEXITCODE -ne 0) { throw 'Could not disable AC sleep.' }
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0
if ($LASTEXITCODE -ne 0) { throw 'Could not set the AC lid action.' }
powercfg /setactive SCHEME_CURRENT
if ($LASTEXITCODE -ne 0) { throw 'Could not activate the updated power plan.' }

$currentUserSid = [Security.Principal.WindowsIdentity]::GetCurrent().User.Value
$caddyLogs = Join-Path $caddyRoot 'logs'
$caddyState = Join-Path $caddyRoot 'state'
$portfolioRoot = Join-Path $hostRoot 'portfolio'

& icacls.exe $caddyRoot /inheritance:r | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not disable inherited permissions on the Caddy directory.' }
& icacls.exe $caddyRoot /grant:r `
  "*${currentUserSid}:(OI)(CI)F" `
  '*S-1-5-18:(OI)(CI)F' `
  '*S-1-5-32-544:(OI)(CI)F' `
  '*S-1-5-19:(OI)(CI)RX' | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not apply the secure Caddy directory permissions.' }
foreach ($path in @($caddyLogs, $caddyState)) {
  & icacls.exe $path /grant:r '*S-1-5-19:(OI)(CI)M' /T /C | Out-Null
  if ($LASTEXITCODE -ne 0) { throw "Could not grant Caddy service write access to $path" }
}

& icacls.exe $portfolioRoot /inheritance:r | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not disable inherited permissions on the portfolio directory.' }
& icacls.exe $portfolioRoot /grant:r `
  "*${currentUserSid}:(OI)(CI)F" `
  '*S-1-5-18:(OI)(CI)F' `
  '*S-1-5-32-544:(OI)(CI)F' `
  '*S-1-5-19:(OI)(CI)RX' `
  '*S-1-5-20:(OI)(CI)M' | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'Could not apply the secure portfolio directory permissions.' }

foreach ($ruleName in @('Zain Portfolio Caddy HTTP', 'Zain Portfolio Caddy HTTPS')) {
  $existing = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
  if ($existing) {
    $existing | Remove-NetFirewallRule
  }
}
$caddyFirewallFilters = Get-NetFirewallApplicationFilter -ErrorAction SilentlyContinue |
  Where-Object { $_.Program -and $_.Program.Equals($caddyExe, [StringComparison]::OrdinalIgnoreCase) }
foreach ($filter in $caddyFirewallFilters) {
  Get-NetFirewallRule -AssociatedNetFirewallApplicationFilter $filter -ErrorAction SilentlyContinue |
    Remove-NetFirewallRule
}

& $caddyExe validate --config $caddyfile --adapter caddyfile
if ($LASTEXITCODE -ne 0) { throw 'Caddy configuration validation failed.' }

$service = Get-Service -Name 'CaddyPortfolio' -ErrorAction SilentlyContinue
if (-not $service) {
  & $serviceExe install
  if ($LASTEXITCODE -ne 0) { throw 'Caddy service installation failed.' }
}

$service = Get-Service -Name 'CaddyPortfolio' -ErrorAction Stop
$serviceDetails = Get-CimInstance Win32_Service -Filter "Name='CaddyPortfolio'"
if (-not $serviceDetails.StartName.Equals('NT AUTHORITY\LocalService', [StringComparison]::OrdinalIgnoreCase)) {
  if ($service.Status -eq 'Running') {
    Stop-Service -Name 'CaddyPortfolio' -Force
  }
  & sc.exe config CaddyPortfolio obj= 'NT AUTHORITY\LocalService' | Out-Null
  if ($LASTEXITCODE -ne 0) { throw 'Could not configure Caddy to run as LocalService.' }
} elseif ($service.Status -eq 'Running') {
  Stop-Service -Name 'CaddyPortfolio' -Force
}

Start-Service -Name 'CaddyPortfolio'
Set-Service -Name 'CaddyPortfolio' -StartupType Automatic

$healthy = $false
for ($attempt = 1; $attempt -le 15; $attempt++) {
  try {
    $response = Invoke-WebRequest -Uri 'http://127.0.0.1:8080/' -UseBasicParsing -TimeoutSec 5
    if ([int]$response.StatusCode -eq 200) {
      $healthy = $true
      break
    }
  } catch {
    Start-Sleep -Seconds 1
  }
}

if (-not $healthy) {
  throw 'Caddy service started but its local health endpoint did not return HTTP 200.'
}

Get-Service -Name 'CaddyPortfolio' | Select-Object Name, Status, StartType
