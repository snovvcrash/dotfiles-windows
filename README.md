dotfiles-windows
==========

## Create

Track WSL branch as a submodule:

```
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule add https://github.com/snovvcrash/dotfiles-linux wsl
Adds "branch = wsl" to .gitmodules (same as "git config -f .gitmodules submodule.wsl.branch wsl")
```

## Clone

```
~$ WIN_DOTFILES_DIR="$(wslpath `cmd.exe /C "echo %USERPROFILE%" | tr -d "\r"`)/.dotfiles"
~$ git clone https://github.com/snovvcrash/dotfiles-windows "${WIN_DOTFILES_DIR}"
~$ ln -sv "${WIN_DOTFILES_DIR}/wsl" ~/.dotfiles
```

## Init

```
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule update --init --remote
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule foreach "git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)"
```

## Update

```
/mnt/c/Users/snovvcrash/.dotfiles$ cd wsl
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ git commit -am "Changes in wsl repo"
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ git push origin wsl
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ cd ..
/mnt/c/Users/snovvcrash/.dotfiles$ git commit -am "Changes in dotfiles-windows repo"
/mnt/c/Users/snovvcrash/.dotfiles$ git push origin master
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
