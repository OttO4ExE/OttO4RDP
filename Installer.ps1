# Suppress progress bar to significantly speed up downloads
$ProgressPreference = 'SilentlyContinue'

# Download and install Google Chrome for automation
Write-Host "Downloading Google Chrome..."
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$chromeInstaller = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstaller

Write-Host "Installing Google Chrome silently..."
Start-Process -FilePath $chromeInstaller -ArgumentList "/silent /install" -Wait
Remove-Item -Path $chromeInstaller -Force
Write-Host "Chrome installation completed!"

Write-Host "All tasks completed successfully! Ready for automation."
