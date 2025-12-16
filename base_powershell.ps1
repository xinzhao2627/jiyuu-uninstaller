Set-ExecutionPolicy Bypass -Scope CurrentUser

Write-Host "Jiyuu Force Uninstaller" -ForegroundColor Cyan
Write-Host "Find the source code at github.com/xinzhao2627/jiyuu-uninstaller" -ForegroundColor Cyan



Write-Host "Stopping Jiyuu..."
$appName = "jiyuu";
Stop-Process -Name $appName

Write-Host "Removing block data and restrictions lock (if there is any)..."
$roamingPath = "$env:USERPROFILE\AppData\Roaming\jiyuu\jiyuuData.db";
$restrictionFile = "$env:APPDATA\jiyuu\hasRestriction.txt"
if (Test-Path $roamingPath) {
    Remove-Item -Path $roamingPath -Force -ErrorAction SilentlyContinue
    Write-Host "Block data removed"
}
if (Test-Path $restrictionFile) {
    Remove-Item -Path $restrictionFile -Force -ErrorAction SilentlyContinue
    Write-Host "Restrictions removed"

}
Write-Host "Running uninstaller" -ForegroundColor Yellow
$uninstallerPath = "$env:LOCALAPPDATA\Programs\jiyuu\Uninstall jiyuu.exe"

if (Test-Path $uninstallerPath) {
    Start-Process -FilePath $uninstallerPath -ArgumentList "/S"
    Write-Host "uninstaller completed." -ForegroundColor Green
}
else {
    Write-Host "Built in uninstaller not found"
}