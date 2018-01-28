# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Version: 6

# PATH setup {{{
export PATH="/opt/cuda/bin/:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/patrick/bin"
# }}}

# EDITOR setup {{{
export EDITOR=/usr/bin/vim
export editor=/usr/bin/vim
# }}}

# keybindings for urxvt + zsh shenanigans {{{
bindkey  "^[[2~"  quoted-insert
bindkey  "^[[3~"  delete-char
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
# }}}

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# pwdgen
aes() {
    echo -n $1 | openssl enc -e -aes-256-cbc -a -salt
}
autoload aes

# aliases {{{

alias la="ls -la --block-size=k"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="rm -i"
alias cp="rsync -avh --progress"

alias yt='mpv $(youtube-dl -f 22 -g "$(xclip -selection c -o)")'

# std aliases {{{
alias cfz="vim ~/.zshrc"
alias cfi="vim ~/.config/i3/config"
alias cfr="vim ~/.config/ranger/rc.conf"
alias cfv="vim ~/.vimrc"
alias cfq="vim ~/.config/qutebrowser/config.py"
alias cfs="vim ~/github/Startpage/startpage.rmd"
alias cfp="vim ~/.config/polybar/config"
# }}}

lastedit() {
    find $1 -type f -printf '%C@ %P\n' | sort -nr | head -1 | cut -d" " -f 2-
}
autoload lastedit

todo() {
    if [[ $# -eq 0 ]];
    then 
        vim ~/todo.md
    else 
        echo "- [ ] $1" >> ~/todo.md
    fi
}
autoload todo


# streamlink aliases {{{
twitch() {
    streamlink twitch.tv/$1 $2
}


mpv_stream() {
    mpv --demuxer-thread=yes --demuxer-readahead-secs=15 $(youtube-dl -g $(/home/patrick/github/scripts/getyturl.py $1 $2 ) $3) $4
}

autoload twitch
autoload mpv_stream

alias soaryn="streamlink twitch.tv/soaryn"
alias amadornes="streamlink twitch.tv/amadornes"
alias poo="streamlink twitch.tv/grand_poobear"
alias waffle="streamlink twitch.tv/giantwaffle"
alias monstercat="streamlink twitch.tv/monstercat"
alias filthy="streamlink twitch.tv/filthyrobot"
# }}}
# }}}

autoload -U zmv

# case-insensitive tab complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# sudo - <esc> {{{
sudo-command-line() {
	LBUFFER="sudo $LBUFFER"
}

zle -N sudo-command-line

# Defined shortcut keys: [Esc] [Esc]
bindkey '\e\e' sudo-command-line

alias s!!="sudo !!"
# }}}

# Powerline {{{
POWERLINE_DIR=$( pip show powerline-status | grep Location | cut -d " " -f2 )

if [[ -r $POWERLINE_DIR/powerline/bindings/zsh/powerline.zsh ]]; then
    powerline-daemon -q
    source $POWERLINE_DIR/powerline/bindings/zsh/powerline.zsh
fi
# }}}
