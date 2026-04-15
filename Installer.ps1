# Suppress progress bar to significantly speed up downloads
$ProgressPreference = 'SilentlyContinue'

# Download and install Python 3.13.3
Write-Host "Downloading Python 3.13.3..."
$pythonUrl = "https://www.python.org/ftp/python/3.13.3/python-3.13.3-amd64.exe"
$pythonInstaller = "$env:TEMP\python-installer.exe"
Invoke-WebRequest -Uri $pythonUrl -OutFile $pythonInstaller

Write-Host "Installing Python silently..."
Start-Process -FilePath $pythonInstaller -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 Include_test=0" -Wait
Remove-Item -Path $pythonInstaller -Force

# Refresh environment variables to make python and pip accessible in the current session
Write-Host "Refreshing environment variables..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Upgrade pip and install required packages
Write-Host "Installing selenium and requests..."
python -m pip install --upgrade pip
python -m pip install selenium requests

# Download and install Google Chrome
Write-Host "Downloading Google Chrome..."
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$chromeInstaller = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstaller

Write-Host "Installing Google Chrome silently..."
Start-Process -FilePath $chromeInstaller -ArgumentList "/silent /install" -Wait
Remove-Item -Path $chromeInstaller -Force

Write-Host "All tasks completed successfully! Ready for automation."