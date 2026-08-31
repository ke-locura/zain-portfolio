# Portfolio hosting runbook

## Architecture

The production portfolio stays on the HP EliteBook 850 G7. Tailscale is only the public ingress layer.

```text
Recruiter
  -> HTTPS (Tailscale certificate)
  -> Tailscale Funnel
  -> http://127.0.0.1:80
  -> Caddy Windows service
  -> C:\web\portfolio\current
```

The production URL is **https://zain.tail47f340.ts.net/**. DuckDNS, router port forwarding, inbound public web firewall rules, public SSH, and a development server are not part of this architecture.

## Paths and services

| Purpose | Location or service |
| --- | --- |
| Source repository | `C:\Users\ahmed\OneDrive\Desktop\Zain` |
| Live static site | `C:\web\portfolio\current` |
| Previous deployment | `C:\web\portfolio\previous` |
| Retained releases | `C:\web\portfolio\releases` |
| Caddy executable and config | `C:\web\caddy\caddy.exe`, `C:\web\caddy\Caddyfile` |
| Caddy service | `CaddyPortfolio` (Automatic, delayed start, LocalService) |
| Caddy health origin | `http://127.0.0.1:8080/` |
| Tailscale service | `Tailscale` (Automatic, unattended mode) |
| GitHub repository | `https://github.com/ke-locura/zain-portfolio` |
| Actions runner | `C:\actions-runner`, label `portfolio` |

Caddy listens only on IPv4 loopback ports 80 and 8080. Funnel terminates public TLS and persistently proxies the root path to `http://127.0.0.1:80`.

## Deployment

A push to `main` starts `.github/workflows/deploy.yml` on the EliteBook's self-hosted runner. The job checks out a clean copy, installs locked dependencies with `npm ci`, runs Svelte and TypeScript checks, runs any configured tests, creates the static build, and calls `scripts/Deploy-Portfolio.ps1`.

The deployment script copies the successful build to a new immutable release, validates all primary pages, every generated case study, `zain.png`, and `resume.pdf`, then promotes it. The old live directory becomes `previous`. If the local Caddy health checks fail, the script restores the old site before failing the workflow. It retains the five newest immutable releases.

Manual deployment from an elevated or appropriately permitted PowerShell session:

```powershell
npm ci
npm run check
npm run build
.\scripts\Deploy-Portfolio.ps1 -BuildPath .\build -DeployRoot C:\web\portfolio
```

Manual rollback:

```powershell
.\scripts\Rollback-Portfolio.ps1
```

## Health and status checks

```powershell
Get-Service CaddyPortfolio, Tailscale
curl.exe --fail http://127.0.0.1:8080/
& 'C:\Program Files\Tailscale\tailscale.exe' status
& 'C:\Program Files\Tailscale\tailscale.exe' funnel status
curl.exe --fail https://zain.tail47f340.ts.net/
```

Expected Funnel mapping:

```text
https://zain.tail47f340.ts.net/
|-- proxy http://127.0.0.1:80
```

Important routes are `/`, `/work/`, `/web/`, `/lab/`, `/about/`, `/contact/`, `/resume/`, and each `/work/<slug>/` case study. Unknown paths should return HTTP 404.

## Logs

- Caddy access log: `C:\web\caddy\logs\access.log`
- Caddy service logs: `C:\web\caddy\logs\caddy-service.*.log`
- Actions runner diagnostics: `C:\actions-runner\_diag`
- GitHub workflow history: the repository's **Actions** tab
- Windows service events: Event Viewer, **Windows Logs > System**

No authentication token or runner credential belongs in this file or in Git.

## Restart behavior

Windows starts Tailscale automatically in unattended mode and starts Caddy automatically with delayed start. The Funnel was created with `--bg`, so its configuration resumes after a reboot or Tailscale restart and keeps the same node hostname. The Actions runner is also installed as an automatic Windows service. AC sleep is disabled and closing the lid on AC power does not suspend the host.

After maintenance or a restart, use the health commands above to confirm all three services and the public URL.

## Disable or restore public access

Disable only public Funnel access while leaving the local site running:

```powershell
& 'C:\Program Files\Tailscale\tailscale.exe' funnel --https=443 off
```

Restore the persistent public proxy:

```powershell
& 'C:\Program Files\Tailscale\tailscale.exe' funnel --bg http://127.0.0.1:80
```

Stop the local origin as well:

```powershell
Stop-Service CaddyPortfolio
```

Restore it:

```powershell
Start-Service CaddyPortfolio
```

## Adding future projects

For another static section on the same portfolio hostname, deploy it to a separate directory under `C:\web`, add a path-specific Caddy route, validate the Caddyfile, and reload Caddy. Keep every origin bound to loopback and let Funnel remain the only public ingress. For a separate public hostname, add and approve a distinct Tailscale node or deliberately design a supported Funnel port/hostname arrangement; do not open router or Windows inbound ports as a shortcut.

Before changing the live Caddyfile:

```powershell
& 'C:\web\caddy\caddy.exe' validate --config C:\web\caddy\Caddyfile --adapter caddyfile
& 'C:\web\caddy\caddy.exe' reload --config C:\web\caddy\Caddyfile --adapter caddyfile
```
