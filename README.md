dotfiles-windows
==========

Everything is being done under WSL console.

## [Create]

Track WSL branch as a submodule:

```bash
# Adds "branch = wsl" to .gitmodules (same as "git config -f .gitmodules submodule.wsl.branch wsl")
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule add https://github.com/snovvcrash/dotfiles-linux wsl
```

## Deploy

```bash
PS > wsl

# Remount with custom options
~$ sudo bash -c 'cat << EOF > /etc/wsl.conf
[automount]
root = /mnt/
options = "metadata,umask=22,fmask=11"
EOF'

~$ exit
PS > wsl --shutdown
PS > wsl

# Update & Upgrade
~$ sudo apt update && sudo apt upgrade -y

# Install some stuff
~$ sudo apt install -y \
  curl                 \
  net-tools            \
  mlocate              \
  cmake                \
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
~$ curl -ksL https://github.com/snovvcrash/dotfiles-linux/raw/master/00-autoconfig/zsh.sh | bash

# Install tmux
~$ curl -ksL https://github.com/snovvcrash/dotfiles-linux/raw/master/00-autoconfig/tmux.sh | bash

# Install fzf
~$ curl -ksL https://github.com/snovvcrash/dotfiles-linux/raw/master/00-autoconfig/fzf.sh | bash
```

## Push

```bash
/mnt/c/Users/snovvcrash/.dotfiles$ cd wsl
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ git commit -am "Changes in wsl branch of dotfiles-linux"
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ git push origin wsl
/mnt/c/Users/snovvcrash/.dotfiles/wsl$ cd ..
/mnt/c/Users/snovvcrash/.dotfiles$ git commit -am "Changes in master branch of dotfiles-windows"
/mnt/c/Users/snovvcrash/.dotfiles$ git push origin master
```

## Pull

```bash
/mnt/c/Users/snovvcrash/.dotfiles$ git pull
/mnt/c/Users/snovvcrash/.dotfiles$ git submodule update --remote --merge
```

## Useful links

* [Мастерская хакера. Подборка полезных инструментов для Windows и Linux](https://xakep.ru/2021/11/15/hacker-tools-windows-linux/)

### Terminals

* [cmder](https://cmder.net/)
* [microsoft/terminal](https://github.com/microsoft/terminal) · [Themes](https://windowsterminalthemes.dev/)
* [wsltty](https://github.com/mintty/wsltty/releases)

### Widgets

* [Enigma (Rainmeter)](https://github.com/Kaelri/Enigma) + Fix LAN display [issue](https://github.com/Kaelri/Enigma/issues/73)
* [Winstep Nexus](https://www.winstep.net/nexus.asp)

### Personalization

* [Eun/MoveToDesktop](https://github.com/Eun/MoveToDesktop)
* [QTTabBar](http://qttabbar.wikidot.com/)
* [Sizer](http://www.brianapps.net/sizer4/)
* [Winaero Tweaker](https://winaero.com/download.php?view.1796) (Menu Show Delay)

### Text Editors

* [Obsidian](https://obsidian.md/)
* [Sublime Text 3](https://www.sublimetext.com/3)
* [Typora](https://typora.io/)

### Remote Clients

* [X2Go Client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient)
* [Xftp](https://www.netsarang.com/ru/xftp/)
* [Xshell](https://www.netsarang.com/ru/xshell/)

### Other

* [Ditto Clipboard Manager](https://ditto-cp.sourceforge.io/)
* [Greenshot](https://getgreenshot.org/downloads/)
* [HeidiSQL](https://www.heidisql.com/download.php)
* [K-Lite Codec Pack](https://codecguide.com/download_kl.htm) (Standard)
* [microsoft/PowerToys](https://github.com/microsoft/PowerToys/releases/)
* [Proxifier](https://www.proxifier.com/download/)
* [ShareX](https://getsharex.com/)
* [TotalRegistry](https://github.com/zodiacon/TotalRegistry/releases)
* [VxSrv](https://github.com/ArcticaProject/vcxsrv/releases) (WSL)
