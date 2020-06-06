dotfiles-windows
==========

Everything is being done under WSL console.

## [Create]

Track WSL branch as a submodule:

```sh
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule add https://github.com/snovvcrash/dotfiles-linux wsl
Adds "branch = wsl" to .gitmodules (same as "git config -f .gitmodules submodule.wsl.branch wsl")
```

## Deploy

```sh
# Update & Upgrade
~$ sudo apt update && sudo apt upgrade -y

# Install some stuff
~$ sudo apt install -y \
  curl \
  net-tools \
  mlocate \
  cmake \
  g++

# Clone dotfiles
~$ WIN_DOTFILES_DIR="$(wslpath `cmd.exe /C "echo %USERPROFILE%" | tr -d "\r"`)/.dotfiles"
~$ git clone https://github.com/snovvcrash/dotfiles-windows "${WIN_DOTFILES_DIR}"
~$ ln -sv "${WIN_DOTFILES_DIR}/wsl" ~/.dotfiles

# Init dotfiles
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule update --init --remote
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule foreach "git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)"

# Configure bash (lightweight)
~$ cat ~/.dotfiles/bash/.bashrc >> ~/.bashrc
# Or install zsh
~$ curl https://raw.githubusercontent.com/snovvcrash/dotfiles-linux/master/00-autoconfig/zsh.sh |bash

# Install Python
~$ sudo apt install python2.7 -y && sudo ln -sv /usr/bin/python2.7 /usr/bin/python
~$ curl https://raw.githubusercontent.com/snovvcrash/dotfiles-linux/master/00-autoconfig/python.sh |bash

# Install tmux
~$ curl https://raw.githubusercontent.com/snovvcrash/dotfiles-linux/master/00-autoconfig/tmux.sh |bash

# Misc
~$ bash ~/.dotfiles/git/INSTALL.sh \
  && bash ~/.dotfiles/ssh/INSTALL.sh \
  && bash ~/.dotfiles/fzf/INSTALL.sh \
  && sudo -E bash ~/.dotfiles/wslconf/INSTALL.sh
```

## Update

```sh
/mnt/c/Users/snovvcrash/.dotfiles$ cd wsl
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ git commit -am "Changes in wsl branch of dotfiles-linux"
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ git push origin wsl
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ cd ..
/mnt/c/Users/snovvcrash/.dotfiles$ git commit -am "Changes in master branch of dotfiles-windows"
/mnt/c/Users/snovvcrash/.dotfiles$ git push origin master
```

## Useful links

### Terminals

* [cmder](https://cmder.net/)
* [wsltty](https://github.com/mintty/wsltty/releases)

### Other

* [Sublime Text 3](https://www.sublimetext.com/3)
* [QTTabBar](http://qttabbar.wikidot.com/)
* [Enigma (Rainmeter)](https://github.com/Kaelri/Enigma) + Fix LAN display [issue](https://github.com/Kaelri/Enigma/issues/73)
* [Winstep Nexus](https://www.winstep.net/nexus.asp)
* [Winaero Tweaker](https://winaero.com/download.php?view.1796) (Menu Show Delay)
* [VxSrv](https://github.com/ArcticaProject/vcxsrv/releases) (WSL)
* [microsoft/PowerToys](https://github.com/microsoft/PowerToys/releases/)
* [Ditto Clipboard Manager](https://ditto-cp.sourceforge.io/)
* [Sizer](http://www.brianapps.net/sizer4/)
* [Eun/MoveToDesktop](https://github.com/Eun/MoveToDesktop)
