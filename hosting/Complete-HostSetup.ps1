[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  throw 'Run this script from an elevated PowerShell window.'
}

& (Join-Path $PSScriptRoot 'Install-FunnelHost.ps1')
& (Join-Path $PSScriptRoot 'Register-GitHubRunner.ps1')

Write-Output 'The production web services and GitHub Actions runner are installed.'
