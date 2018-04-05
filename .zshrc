# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Last modified: 2018|03|30

# PATH defs
source ~/.zprofile

# todo-list {{{
if [[ $(grep "\[[ x]\]" ~/todo.md | wc -l) != 0 ]]
then
    mdv ~/todo.md -t Lagoona
fi

# }}}

# urxvt/st + zsh shenanigans {{{
bindkey    "^[[2~"  quoted-insert
bindkey    "^[[3~"  delete-char
bindkey -a "^[[3~"  delete-char
bindkey    "^[[H"   beginning-of-line
bindkey    "^[[1~"   beginning-of-line
bindkey    "^[[F"   end-of-line
bindkey    "^[[4~"   end-of-line
bindkey    "^?"     backward-delete-char
bindkey -v
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish
# }}} 

# History {{{
export HISTSIZE=100000
export HISTFILE="$HOME/.hisory"
export SAVEHIST=$HISTSIZE
# }}}

# reaction time on esc
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
alias rm="trash"
alias rmi="rm -i"
alias rssp="rsync -avhz --progress"
alias rsmv="rsync -avhz --progress --remove-source-files"

ffind() {
    if [[ $# == 2 ]]
    then
        grep -rnw $1 -e $2
    else
        echo '\033[0;31m usage \033[0m: grep -rnw $1 -e $2'
    fi
}
autoload ffind

sync() {
    if [[ $# != 1 ]]
    then
        echo 'err'
    else
        if [[ $1 == *"push"* ]]
        then
           option=$(awk '/^push/{$1 = ""; $2=""; print $0}' .rsync | sed 's/\ \+\"//' | sed 's/\"//')
        else
           option=$(awk '/^pull/{$1 = ""; $2=""; print $0}' .rsync | sed 's/\ \+\"//' | sed 's/\"//')
        fi
        rsync $(echo ${option})
    fi
}
autoload sync

alias yt='mpv "$(xclip -selection c -o)"'

alias vim='nvim'
alias v='vim'

# std aliases {{{
export DOTFILES_DIR='~/github/dotfiles'
alias cfz="vim $DOTFILES_DIR/.zshrc -c 'lcd $DOTFILES_DIR'"
alias cfi="vim $DOTFILES_DIR/.config/i3/config -c 'lcd $DOTFILES_DIR'"

alias cfr="vim $DOTFILES_DIR/.config/ranger/rc.conf -c 'lcd $DOTFILES_DIR'"
alias cfrs="vim $DOTFILES_DIR/.config/ranger/scope.sh -c 'lcd $DOTFILES_DIR'"
alias cfrr="vim $DOTFILES_DIR/.config/ranger/rifle.conf -c 'lcd $DOTFILES_DIR'"

alias cfv="vim $DOTFILES_DIR/.vimrc -c 'lcd $DOTFILES_DIR'"
alias cfq="vim $DOTFILES_DIR/.config/qutebrowser/config.py -c 'lcd $DOTFILES_DIR'"
alias cfs="vim ~/github/Startpage/startpage.rmd"
alias cfp="vim ~/.config/polybar/config"

alias cfS="vim ~/github/st/config.h && make -C ~/github/st && sudo make install -C ~/github/st"

alias gh="cd ~/github"
alias ghd="cd ~/github/dotfiles"

alias gl="cd ~/gitlab"
alias gD="cd ~/Downloads"
alias gd="cd ~/Dokumente"
alias gV="cd ~/Videos"
alias gu="cd ~/University"
alias gc="cd ~/.config"
alias gt="cd ~/.local/share/Trash"

# aliases for work at internship
alias gah="cd ~/gitlab/InternReport/sourcecode/afshome"

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


# streams{{{
twitch() {
    mpv "ytdl://twitch.tv/$1" --ytdl-format=$2
}
autoload twitch

alias soaryn="mpv ytdl://twitch.tv/soaryn"
alias amadornes="mpv ytdl://twitch.tv/amadornes"
alias poo="mpv ytdl://twitch.tv/grand_poobear"
alias waffle="mpv ytdl://twitch.tv/giantwaffle"
alias monstercat="mpv ytdl://twitch.tv/monstercat"
alias filthy="mpv ytdl://twitch.tv/filthyrobot"

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
#bindkey '^\e' sudo-command-line

alias s!!="sudo !!"
# }}}

# Powerline {{{
POWERLINE_DIR=$( pip show powerline-status | grep Location | cut -d " " -f2 )

if [[ -r $POWERLINE_DIR/powerline/bindings/zsh/powerline.zsh ]]; then
    source $POWERLINE_DIR/powerline/bindings/zsh/powerline.zsh
fi
# }}}
