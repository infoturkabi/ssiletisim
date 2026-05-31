# =================================================================
#  SS ILETISIM - ONE-CLICK DEPLOY
# =================================================================
#  Stages, commits, and pushes to GitHub. Cloudflare Pages auto-deploys.
#
#  HOW TO RUN (PowerShell):
#    powershell -ExecutionPolicy Bypass -File C:\TSARA\01_PROJECTS\SS_ILETISIM\05_WEBSITE\DEPLOY.ps1
#
#  With a custom commit message:
#    powershell -ExecutionPolicy Bypass -File C:\TSARA\01_PROJECTS\SS_ILETISIM\05_WEBSITE\DEPLOY.ps1 "fix phone number"
#
#  ONE-TIME SETUP (only first time, see README.md):
#    1) Create empty GitHub repo named "ssiletisim"
#    2) cd C:\TSARA\01_PROJECTS\SS_ILETISIM\05_WEBSITE
#    3) git init
#    4) git branch -M main
#    5) git remote add origin https://github.com/YOUR-USERNAME/ssiletisim.git
#    6) Then run this script.
# =================================================================

param([string]$Message = "")

$ErrorActionPreference = "Stop"
$Repo = "C:\TSARA\01_PROJECTS\SS_ILETISIM\05_WEBSITE"

Write-Host ""
Write-Host "=== SS ILETISIM DEPLOY ===" -ForegroundColor Cyan
Write-Host ""

# Step 1 - go to repo
Set-Location $Repo
Write-Host "[1/6] Folder: $Repo" -ForegroundColor Gray

# Step 2 - check git repo exists
if (-not (Test-Path ".git")) {
    Write-Host "[2/6] No git repo yet. Run the ONE-TIME SETUP commands first (see README.md)." -ForegroundColor Red
    exit 1
}
Write-Host "[2/6] Git repo OK" -ForegroundColor Gray

# Step 3 - clear stale git lock if any
$lock = Join-Path $Repo ".git\index.lock"
if (Test-Path $lock) {
    Remove-Item $lock -Force
    Write-Host "[3/6] Cleared stale git lock" -ForegroundColor Yellow
} else {
    Write-Host "[3/6] No stale lock (good)" -ForegroundColor Gray
}

# Step 4 - stage all changes
git add .
$changes = git status --porcelain
if (-not $changes) {
    Write-Host "[4/6] Nothing to commit. Already up to date." -ForegroundColor Yellow
    exit 0
}
Write-Host "[4/6] Staged changes:" -ForegroundColor Gray
git status --short

# Step 5 - commit
if (-not $Message) {
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $Message = "deploy: site update $stamp"
}
git commit -m $Message
Write-Host "[5/6] Committed: $Message" -ForegroundColor Green

# Step 6 - push
Write-Host "[6/6] Pushing to GitHub..." -ForegroundColor Cyan
git push origin main

Write-Host ""
Write-Host "==================================================" -ForegroundColor Green
Write-Host " SUCCESS - pushed. Cloudflare will publish in ~30-60 seconds." -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host " Verify in INCOGNITO (Ctrl+Shift+N):" -ForegroundColor Gray
Write-Host "   https://ssiletisim.com" -ForegroundColor Yellow
Write-Host "   (or the .pages.dev URL if domain not yet linked)" -ForegroundColor Gray
Write-Host ""
