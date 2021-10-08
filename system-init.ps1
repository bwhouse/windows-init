

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function install-package($package, $params) {
    choco install $package --yes $params
}



Install-Chocolatey


Install-Package -package openssh -params --version=8.6.0-beta1 #install newer version of SSH loads by defaults to ensure scrolling works in TMUX 
install-package -package gsudo
install-package -package cascadiacodepl
install-package -package git
install-package -package microsoft-windows-terminal
install-package -package vscode
install-package -package iperf3

Install-Module posh-git
Install-Module oh-my-posh

# Install profiles
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/bwhouse/windows-init/main/Microsoft.PowerShell_profile.ps1' -OutFile $PROFILE
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/bwhouse/windows-init/main/settings.json' -OutFile $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

# Install console background
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/bwhouse/windows-init/main/console_wallpaper.png' -OutFile $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\console_wallpaper.png

# set GIT_SSH user environment varible
$SSHPath = (Get-Command -Name 'ssh.exe').Source
[Environment]::SetEnvironmentVariable('GIT_SSH', $SSHPath, 'User')