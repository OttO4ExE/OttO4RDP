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

# Download and install Urban VPN to avoid IP blocking
Write-Host "Downloading Urban VPN..."
$urbanUrl = "https://github.com/OttO4ExE/OttO4RDP/releases/download/v5.1.0/UrbanVPN.exe"
$urbanInstaller = "$env:TEMP\UrbanVPN.exe"
Invoke-WebRequest -Uri $urbanUrl -OutFile $urbanInstaller

Write-Host "Installing Urban VPN silently..."
Start-Process -FilePath $urbanInstaller -ArgumentList "/S" -Wait
Remove-Item -Path $urbanInstaller -Force

Write-Host "All tasks completed successfully! Ready for automation."
