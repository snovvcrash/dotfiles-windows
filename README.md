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
