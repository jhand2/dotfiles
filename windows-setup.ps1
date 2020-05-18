# Attempt to setup a Windows VM to match my linux environment as closely
# as possible. Note, this script is not very well written. I don't generally
# run it directly, it is just to remember all the commands I need to make a
# Windows VM.

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Set up powershell so that vim works properly
Install-Package -Name PSReadline -Force
Set-PSReadlineOption -EditMode vi -BellStyle None

# Install Chocolatey packages
choco install -y vim git curl
choco install -y win32-openssh -params "/SSHServerFeature /KeyBasedAuthenticationFeature"

# Enable some windows features
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

