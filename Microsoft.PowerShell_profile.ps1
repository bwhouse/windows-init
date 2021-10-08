Import-Module posh-git
Import-Module oh-my-posh
set-poshprompt -theme craver

# override path so that newer version of SSH loads by defaults to ensure scrolling works in TMUX 
$env:path = "c:\program files\openssh-win64;$env:Path"

