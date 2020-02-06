# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '+' '+' '+' '+'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/davidv7/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -e
zstyle ':completion:*' menu yes select
# End of lines configured by zsh-newuser-install
#
#
#
#
# ALIASES
alias i="sudo zypper install"
alias in="sudo zypper install --no-recommends"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias hc=herbstclient
alias kx="sudo killall X"
alias ubuntu="docker run -it ubuntu bash"
alias void="docker run -it voidlinux/voidlinux /bin/sh"
alias alpine="docker run -it alpine /bin/bash"
alias arch="docker run -it archlinux bash"
alias u="sudo zypper dup"
alias m="cd ~/Documents/Projects/Mag/"
alias mn="cd ~/Documents/Projects/Mag/notes"
alias caps="setxkbmap -option caps:escape"
alias g="cd ~/go/src/github.com/davidv171/"

alias deezer="chromium --app=https://www.deezer.com"

PATH=$PATH:~/go/bin/

function nv {
    nvim $(fzf)
}

#vim:ft=sh
