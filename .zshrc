# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Version: 5

# PATH setup
export PATH="/opt/cuda/bin/:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/patrick/bin"

# EDITOR setup
export EDITOR=/usr/bin/vim
export editor=/usr/bin/vim

# keybindings for urxvt + zsh shenanigans
bindkey  "^[[2~"  quoted-insert
bindkey  "^[[3~"  delete-char
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# pwdgen
aes() {
    echo -n $1 | openssl enc -e -aes-256-cbc -a -salt
}
autoload aes

# aliase
alias vncstart="sudo x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -auth /var/run/lightdm/root/:0"
alias minecraft="java -jar /home/patrick/.minecraft/launcher.jar"

alias sv="sudo vim"
alias v="vim"
alias zshconfig="vim ~/.zshrc"
alias la="ls -la"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="trash"
alias jn="jupyter notebook"

# std aliases
alias cfz="vim ~/.zshrc"
alias cfi="vim ~/.config/i3/config"
alias cfr="vim ~/.config/ranger/rc.conf"
alias cfv="vim ~/.vimrc"


# streamlink aliases
twitch() {
    streamlink twitch.tv/$1 $2
}

lastedit() {
    find $1 -type f -printf '%C@ %P\n' | sort -nr | head -1 | cut -d" " -f 2-
}

mpv_stream() {
    mpv $(youtube-dl -g $(/home/patrick/github/scripts/getyturl.py $1 $2 ) $3) $4
}

autoload twitch
autoload lastedit
autoload mpv_stream
alias soaryn="streamlink twitch.tv/soaryn"
alias amadornes="streamlink twitch.tv/amadornes"
alias poo="streamlink twitch.tv/grand_poobear"
alias waffle="streamlink twitch.tv/giantwaffle"
alias monstercat="streamlink twitch.tv/monstercat"
alias filthy="streamlink twitch.tv/filthyrobot"

#alias magical="/home/patrick/github/scripts/getyturl.py magicalmusicchannel 'Magical Music Radio'"
#alias goodlife="/home/patrick/github/scripts/getyturl.py sensualmusique1 'Good Life Radio'"
#alias cym="/home/patrick/github/scripts/getyturl.py chillyourmind 'ChillYourMind Radio'"

alias magical="mpv_stream user/magicalmusicchannel 'Magical Music Radio'"
alias goodlife="mpv_stream user/sensualmusique1 'Good Life Radio'"
#alias cym="mpv_stream user/chillyourmind 'ChillYourMind Radio'"
alias monstafluff="mpv_stream channel/UCMwePVHRpDdfeUcwtDZu2Dw 'Gaming Music Radio'"

autoload -U zmv

# case-insensitive tab complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# add sudo infront of command or last command if empty
sudo-command-line() {
	LBUFFER="sudo $LBUFFER"
}

zle -N sudo-command-line


# Defined shortcut keys: [Esc] [Esc]
bindkey '\e\e' sudo-command-line

# Powerline
POWERLINE_DIR=$( pip show powerline-status | grep Location | cut -d " " -f2 )

if [[ -r $POWERLINE_DIR/powerline/bindings/zsh/powerline.zsh ]]; then
    powerline-daemon -r -q
    source $POWERLINE_DIR/powerline/bindings/zsh/powerline.zsh
fi


# Color
#export LS_COLORS=$LS_COLORS:di=4
