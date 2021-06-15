PowerShell
==========

Install modules:

```powershell
PS > Install-Module posh-git -Scope CurrentUser
PS > Install-Module oh-my-posh -Scope CurrentUser
PS > Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
```

Configure execution policy to allow scripts (need to source `Microsoft.PowerShell_profile.ps1` when starting PowerShell):

```powershell
PS > Set-ExecutionPolicy RemoteSigned
```

Create a symlink to the `Microsoft.PowerShell_profile.ps1` script (see [`INSTALL`](https://github.com/snovvcrash/dotfiles-windows/blob/master/powershell/INSTALL)).

Install a Nerd Font that will render Powerline glyphs correctly – [`Meslo LG M Regular`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo) does its job well. Just go to [releases](https://github.com/ryanoasis/nerd-fonts/releases), select the font you want to install (`Meslo.zip` in this case), unzip it and install from the right-click menu.

A wide variety of color schemes for Windows Terminal can be found [here](https://windowsterminalthemes.dev/).

## Refs

* [Windows Terminal Powerline Setup / Microsoft Docs](https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup)
