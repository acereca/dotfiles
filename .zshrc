# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Version: 7

source .zprofile

# urxvt/st + zsh shenanigans {{{
bindkey  "^[[2~"  quoted-insert
bindkey  "^[[3~"  delete-char
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish
# }}}

export KEYTIMEOUT=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# pwdgen
aes() {
    echo -n $1 | openssl enc -e -aes-256-cbc -a -salt
}
autoload aes

# aliases {{{

alias la="ls -lahp --block-size=k"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="rm -i"
alias cp="rsync -avh --progress"
alias mv="rsync -avh --progress --remove-source-files"
#alias sync="rsync --exclude '.rsync' --progress $(cat ./.rsync)"

sync() {
    if [[ $# != 1 ]]
    then
        echo 'err'
    else
        if [[ $1 == *"push"* ]]
        then
           option=$(awk '/^push/{$1 = ""; $2=""; print $0}' .rsync | sed 's/\ \+\"//' | sed 's/\"//')
        else
           option=$(awk '/^pull/{$1 = ""; $2=""; print $0}' .rsync | sed 's/\ \+\"//')
        fi
        rsync $(echo ${option})
    fi
}
autoload sync

alias rn="/usr/bin/mv"
alias yt='mpv "$(xclip -selection c -o)"'

alias vim='nvim'
alias v='vim'

# std aliases {{{
alias cfz="vim ~/.zshrc"
alias cfi="vim ~/.config/i3/config"

alias cfr="vim ~/.config/ranger/rc.conf"
alias cfrs="vim ~/.config/ranger/scope.sh"
alias cfrr="vim ~/.config/ranger/rifle.conf"

alias cfv="vim ~/.vimrc"
alias cfq="vim ~/.config/qutebrowser/config.py"
alias cfs="vim ~/github/Startpage/startpage.rmd"
alias cfp="vim ~/.config/polybar/config"

alias cfS="vim ~/github/st/config.h && make -C ~/github/st && sudo make install -C ~/github/st"

alias gh="cd ~/github"
alias gl="cd ~/gitlab"
alias gD="cd ~/Downloads"
alias gd="cd ~/Dokumente"
alias gV="cd ~/Videos"
alias gc="cd ~/.config"
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

alias youtube-aria='youtube-dl --external-downloader aria2c --external-downloader-args "-c -x5"'
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
