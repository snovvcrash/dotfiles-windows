dotfiles-windows
==========

## Create

Track WSL branch as a submodule:

```
~$ git submodule add https://github.com/snovvcrash/dotfiles-linux wsl
Adds "branch = wsl" to .gitmodules (same as "git config -f .gitmodules submodule.wsl.branch wsl")
```

## Clone

```
~$ git clone https://github.com/snovvcrash/dotfiles-windows ~/.dotfiles
~$ ln -sv $(wslpath `cmd.exe /C "echo %USERPROFILE%" | tr -d "\r"`)/.dotfiles/wsl ${HOME}/.dotfiles
```

## Init

```
~/.dotfiles$ git submodule update --init --remote
~/.dotfiles$ git submodule foreach "git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)"
```

## Update

```
~/.dotfiles$ cd wsl
~/.dotfiles/wsl$ git commit -am "Changes in wsl repo"
~/.dotfiles/wsl$ git push origin wsl
~/.dotfiles/wsl$ cd ..
~/.dotfiles$ git commit -am "Changes in dotfiles-windows repo"
~/.dotfiles$ git push origin master
```

## Useful links

### Terminals

* [cmder](https://cmder.net/)
* [wsltty](https://github.com/mintty/wsltty/releases)

### Other

* [VxSrv](https://github.com/ArcticaProject/vcxsrv/releases) (WSL)
* [Sublime Text 3](https://www.sublimetext.com/3)
* [QTTabBar](http://qttabbar.wikidot.com/)
* [Enigma (Rainmeter)](https://github.com/Kaelri/Enigma)
* [Winstep Nexus](https://www.winstep.net/nexus.asp)
