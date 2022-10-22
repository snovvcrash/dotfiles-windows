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

## History Based Prediction (PowerShell 7.0+)

Install [Predictive IntelliSense](https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/):

```
PS > Install-Module PSReadline -Force
PS > Set-PSReadLineOption -PredictionViewStyle {ListView,InlineView}
```

The `ListView` is similar to [PSFzf](https://www.powershellgallery.com/packages/PSFzf).

## Refs

* [Windows Terminal Powerline Setup / Microsoft Docs](https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup)
* [Installing a .nupkg on an offline machine / Nathan Manzi's Blog](https://nmanzi.com/blog/installing-nupkg-offline/)
