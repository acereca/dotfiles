# ZSH Config File 
# Patrick Nisble 
# github.com/acereca
#
# Version: 5

# PATH setup
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/patrick/bin"

# EDITOR setup
export EDITOR=/usr/bin/vim

# keybindings for urxvt + zsh shenanigans
bindkey  "^[[2~"  quoted-insert
bindkey  "^[[3~"  delete-char
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliase
alias vncstart="sudo x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :0 -auth /var/run/lightdm/root/:0"

alias sv="sudo vim"
alias v="vim"
alias zshconfig="vim ~/.zshrc"
alias la="ls -la"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="trash"
alias jn="jupyter notebook"

# streamlink aliases
twitch() {
    streamlink twitch.tv/$1 $2
}

autoload twitch
alias soaryn="streamlink twitch.tv/soaryn"
alias amadornes="streamlink twitch.tv/amadornes"
alias poo="streamlink twitch.tv/grand_poobear"
alias waffle="streamlink twitch.tv/giantwaffle"
alias monstercat="streamlink -p 'mpv --volume 50' twitch.tv/monstercat"
alias filthy="streamlink twitch.tv/filthyrobot"
alias magical="/home/patrick/github/scripts/getyturl.py"
alias goodlife="/home/patrick/github/scripts/getyt_goodlife.py"

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

