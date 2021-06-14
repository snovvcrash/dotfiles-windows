# -- aliases ---------------------------------------------------------

# Git

Function GitStatus {git status $args}
Set-Alias -Name gits -Value GitStatus

Function GitAdd {git add $args}
Set-Alias -Name gita -Value GitAdd

Function GitBranch {git branch $args}
Set-Alias -Name gitb -Value GitBranch

Function GitCommit {git commit $args}
Set-Alias -Name gitc -Value GitCommit

Function GitDiff {git diff $args}
Set-Alias -Name gitd -Value GitDiff

Function GitCheckout {git checkout $args}
Set-Alias -Name gito -Value GitCheckout

# -- posh-git --------------------------------------------------------

Import-Module posh-git

# -- oh-my-posh ------------------------------------------------------

Import-Module oh-my-posh
Set-PoshPrompt -Theme mt
