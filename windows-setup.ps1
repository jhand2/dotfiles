# Attempt to setup a Windows VM to match my linux environment as closely
# as possible. Note, this script is not very well written. I don't generally
# run it directly, it is just to remember all the commands I need to make a
# Windows VM.

$email "me@me.me"
$keyfile = "path/to/privkey"
$user_profile = "C:\Users\me"

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Set up powershell so that vim works properly
Install-Package -Name PSReadline -Force
Set-PSReadlineOption -EditMode vi -BellStyle None

# Install Chocolatey packages
choco install -y vim git curl

# Enable some windows features
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# Generate RSA keypair for ssh
ssh-keygen -t rsa -b 4096 -C $email
Start-Service ssh-agent
ssh-add $keyfile

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git $user_profile\.vim\bundle\Vundle.vim

# Set powershell as the default for ssh sessions
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
