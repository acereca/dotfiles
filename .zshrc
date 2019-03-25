# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Last modified: 2018|12|21

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

# load user modules
for f in ~/.zshrc.d*; do source $f; done

# load ssh-agent
eval $(ssh-agent -s)

# aliases {{{

## kitty only
alias icat="kitty icat"

alias la="ls -lahp --block-size=k"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="trash"
alias rmi="/usr/bin/rm -i"
alias rssp="rsync -avhz --progress"
alias rsmv="rsync -avhz --progress --remove-source-files"

alias p="pacaur --color always"
alias pm="pacman --color always"
alias z="zathura"

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
alias cfk="vim ~/.config/kitty/kitty.conf -c 'lcd ~/.config'"

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

# streams{{{
alias soaryn="mpv ytdl://twitch.tv/soaryn"
alias amadornes="mpv ytdl://twitch.tv/amadornes"
alias poo="mpv ytdl://twitch.tv/grand_poobear"
alias waffle="mpv ytdl://twitch.tv/giantwaffle"
#alias monstercat="mpv ytdl://twitch.tv/monstercat --no-video"
alias filthy="mpv ytdl://twitch.tv/filthyrobot"

alias youtube-aria='youtube-dl --external-downloader aria2c --external-downloader-args "-c -j10 -x10 -s10"'
# }}}
# }}}

autoload -U zmv
autoload -U compinit

alias s!!="sudo !!"
# }}}

source ~/.oh-my-zshrc

# direnv
eval "$(direnv hook zsh)"
