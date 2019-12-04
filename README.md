dotfiles-windows
==========

## Clone

```
~$ git clone https://github.com/snovvcrash/dotfiles-windows .dotfiles
~$ ln -sv $(wslpath `cmd.exe /C 'echo %USERPROFILE%' | tr -d '\r'`)/.dotfiles/wsl ${HOME}/.dotfiles
```

## Init

```
~/.dotfiles$ git submodule update --init --remote
~/.dotfiles$ git submodule foreach 'git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)'
```

## Update

```
~/.dotfiles$ cd wsl
~/.dotfiles/wsl$ git commit -am 'Changes in wsl repo'
~/.dotfiles/wsl$ git push origin wsl
~/.dotfiles/wsl$ cd ..
~/.dotfiles$ git commit -am 'Changes in dotfiles-windows repo'
~/.dotfiles$ git push origin master
```

## Useful links

### ZSH (WSL)

* [Install and set up ZSH as default](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default)
* [Oh My Zsh Basic Installation](https://github.com/ohmyzsh/ohmyzsh#via-curl)
* [Spaceship ZSH](https://github.com/denysdovhan/spaceship-prompt#oh-my-zsh)
* [ZSH Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
* [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

### Terminals

* [cmder](https://cmder.net/)
* [wsltty](https://github.com/mintty/wsltty/releases)

### Other

* [VxSrv](https://github.com/ArcticaProject/vcxsrv/releases) (WSL)
* [A command-line fuzzy finder (fzf)](https://github.com/junegunn/fzf) (WSL)
* [Sublime Text 3](https://www.sublimetext.com/3)
* [QTTabBar](http://qttabbar.wikidot.com/)
* [Enigma (Rainmeter)](https://github.com/Kaelri/Enigma)
* [Winstep Nexus](https://www.winstep.net/nexus.asp)
