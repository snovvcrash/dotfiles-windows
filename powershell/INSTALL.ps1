# -- PROFILE --------------------------------------------------------

Remove-Item $PROFILE
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1"

# -- WinGet ---------------------------------------------------------

## psmux

winget install psmux
winget install pstop
winget install psnet
winget install marlocarlo.omp-manager
winget install marlocarlo.tmuxpanel
