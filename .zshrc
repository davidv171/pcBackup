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
alias discord="chromium --app=https://discordapp.com"
PATH=$PATH:~/go/bin/

alias volume="alsamixer -q"
alias tm='tmux attach || { (while ! tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh; do sleep 0.2; done)& tmux ; }'

alias yast="xdg-su -u root -c /usr/sbin/yast2"
alias ncon="nvim $HOME/.config/nvim/init.vim"
alias pcon="nvim $HOME/.config/polybar/config"
alias hcon="nvim $HOME/.config/herbstluftwm/autostart"
alias p="cd $HOME/Documents/Projects"


function nv {
    nvim $(fzf)
}

function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

xset r rate 180 50
#
#vim:ft=sh
