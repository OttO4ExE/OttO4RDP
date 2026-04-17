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

# Install Selenium via python -m pip to ensure it attaches to the active Python version
Write-Host "Upgrading pip and installing Selenium..."
python -m pip install --upgrade pip
python -m pip install selenium
Write-Host "Selenium and WebDriver preparation completed!"

Write-Host "All tasks completed successfully! Ready for automation."
