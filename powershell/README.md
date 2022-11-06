PowerShell
==========

## Oh My Posh

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

## Better History Navigation

Install [Predictive IntelliSense](https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/) (History Based Prediction in PowerShell 7+):

```
PS > Install-Module PSReadLine -AllowPrerelease -Force
```

Install [PSFzf](https://www.powershellgallery.com/packages/PSFzf):

```
PS > choco install fzf
PS > Install-Module PSFzf -Force
```

## Local PSRepository

```
PS > Register-PSRepository -Name Local -SourceLocation C:\Windows\System32\WindowsPowerShell\v1.0\Packages -InstallationPolicy Trusted
PS > Install-Module -Name PSFzf -Repository Local -Force
```

## Refs

* [Windows Terminal Powerline Setup / Microsoft Docs](https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup)
* [PowerShell modules for a better command line / Damir's Corner](https://www.damirscorner.com/blog/posts/20211119-PowerShellModulesForABetterCommandLine.html)
* [Powershell – How to install the Nuget provider for PowerShell on a offline machine / iTecNote](https://itecnote.com/tecnote/powershell-how-to-install-the-nuget-provider-for-powershell-on-a-offline-machine/)
* [Installing a .nupkg on an offline machine / Nathan Manzi's Blog](https://nmanzi.com/blog/installing-nupkg-offline/)
