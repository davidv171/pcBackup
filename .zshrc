# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '+' '+' '+' '+'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/davidv7/.zshrc'
autoload -Uz compinit compinit # End of lines added by compinstall
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
alias m="cd ~/Documents/Projects/Mag/" alias mn="cd ~/Documents/Projects/Mag/notes" alias caps="setxkbmap -option caps:escape"
alias g="cd ~/go/src/github.com/davidv171/"
alias dots="cd ~/.config/"
alias d="cd $HOME/Documents/"

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
alias gut="git"


function fcd {
	cd "$(dirname $(fzf))"
}

function xc {
	xclip -selection clipboard -i $@
}
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
caps
#
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# vim:ft=sh
#




# WORK STUFF

alias vpn="cd ~/Documents/work/vpn-certif && sudo openvpn --config config_openvpn.conf --auth-user-pass up"

alias idea="bash ~/.local/share/JetBrains/Toolbox/apps/IDEA-U/ch-1/201.6251.22/bin/idea.sh"
alias g="cd /home/davidv7/Documents/work/gtms/"


alias okmbs="docker run -p 8100:8080 --rm -t peterevans/ok-server:latest"
alias octbs="docker run -p 8200:8080 --rm -t peterevans/ok-server:latest"
alias kmbs="docker run -p 8100:80 --rm -t mendhak/http-https-echo"
alias ctbs="docker run -p 8200:80 --rm -t mendhak/http-https-echo"
alias pg="systemctl start postgresql.service"
alias music="cd /run/media/davidv7/01D525B7811668B0/Music"
alias td="tmux new -s dropdown"
alias attd="tmux attach -t dropdown"
alias wt="tmux new -s work"
alias attw="tmux attach -t work"
alias ls="ls --color"
alias gr="pkill gopls && gopls serve"


# .zshrc
fpath+=$HOME/.zsh/pure

# .zshrc
autoload -U promptinit; promptinit
prompt pure

# EDITOR
export VISUAL=nvim
export EDITOR="$VISUAL"




PATH=$PATH:~/Documents/Scripts/
