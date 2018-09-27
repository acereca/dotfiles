# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Last modified: 2018|08|16

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
export HISTFILE="~/.history"
export SAVEHIST=$HISTSIZE
# }}}

# reaction time on esc
export KEYTIMEOUT=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
ssht() {
    ssh -t $1 tmux attach -t $2
}
autoload ssht

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
alias rmi="/usr/bin/rm -i"
alias rssp="rsync -avhz --progress"
alias rsmv="rsync -avhz --progress --remove-source-files"

ffind() {
    if [[ $# == 2 ]]
    then
        grep -rn $1 -e $2
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
alias sv="sudo nvim -u ~/.vimrc"

# std aliases {{{
export DOTFILES_DIR='~/github/dotfiles'
alias chdir="cd"
alias cfz="vim $DOTFILES_DIR/.zshrc -c 'lcd $DOTFILES_DIR'"
alias cfzp="vim $DOTFILES_DIR/.zprofile -c 'lcd $DOTFILES_DIR'"

alias cfs="$EDITOR ~/.ssh/config"

alias cfi="vim $DOTFILES_DIR/.config/i3/config -c 'lcd $DOTFILES_DIR'"
alias cfis="vim $DOTFILES_DIR/.config/i3/ -c 'lcd $DOTFILES_DIR'"

alias cfr="vim $DOTFILES_DIR/.config/ranger/rc.conf -c 'lcd $DOTFILES_DIR'"
alias cfrs="vim $DOTFILES_DIR/.config/ranger/scope.sh -c 'lcd $DOTFILES_DIR'"
alias cfrr="vim $DOTFILES_DIR/.config/ranger/rifle.conf -c 'lcd $DOTFILES_DIR'"

alias cfv="vim $DOTFILES_DIR/.vimrc -c 'lcd $DOTFILES_DIR'"
alias cfvft="vim $DOTFILES_DIR/.vim/ftplugin/ -c 'lcd $DOTFILES_DIR'"
alias cfvs="vim $DOTFILES_DIR/.vim/snippets/ -c 'lcd $DOTFILES_DIR'"

alias cfq="vim $DOTFILES_DIR/.config/qutebrowser/config.py -c 'lcd $DOTFILES_DIR'"
alias cfS="vim ~/github/Startpage/startpage.rmd"
alias cfp="vim ~/.config/polybar/config"

alias cfm="vim $DOTFILES_DIR/.mutt/muttrc -c 'lcd $DOTFILES_DIR'"
alias cfmp="vim $DOTFILES_DIR/.mutt/ -c 'lcd $DOTFILES_DIR'"

alias cfS="vim ~/github/st/config.h && make -C ~/github/st && sudo make install -C ~/github/st"

alias gh="ls -la --color ~/github && cd ~/github"
alias ghd="ls -la --color ~/github/dotfiles && cd ~/github/dotfiles"

alias gl="ls -la --color ~/gitlab && cd ~/gitlab"
alias gB="cd ~/gitlab/BaTh && ls -a && echo '' && git status"

alias gD="ls -la --color ~/Downloads && cd ~/Downloads"
alias gd="ls -la --color ~/Dokumente && cd ~/Dokumente"
alias gV="ls -l --color ~/Videos && cd ~/Videos"
alias gu="ls -la --color ~/University && cd ~/University"
alias gc="ls -l --color ~/.config && cd ~/.config"
alias gt="ls -la --color ~/.local/share/Trash && cd ~/.local/share/Trash"

# aliases for work 
alias gB="cd ~/gitlab/BaTh && ls -la --color"
alias gBd="cd ~/gitlab/BaTh/data && ./sshfs.sh"

# }}}

lastedit() {
    find $1 -type f -printf '%C@ %P\n' | sort -nr | head -1 | cut -d" " -f 2-
}
autoload lastedit

todo() {
    while getopts ":ael" opt; do
        case $opt in
            l)
                mdv ~/todo.md -t Lagoona
                ;;
            e) 
                vim ~/todo.md
                ;;
            a)
                echo "- [ ] $2" >> ~/todo.md
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                ;;

        esac
    done
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

alias youtube-aria='youtube-dl --external-downloader aria2c --external-downloader-args "-c -j10 -x10 -s10"'
# }}}
# }}}

autoload -U zmv
autoload -U compinit

alias s!!="sudo !!"
# }}}

source ~/.oh-my-zshrc
