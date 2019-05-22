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
bindkey    "^[[3~"  delete-char # kitty
bindkey    "^[[H"   beginning-of-line # urxvt
bindkey    "\eOH"   beginning-of-line # kitty
bindkey    "^[[F"   end-of-line # urxvt
bindkey    "\eOF"   end-of-line # kitty
bindkey -v
# }}} 

# History {{{
export HISTFILE="$HOME/.history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
# }}}

# reaction time on esc
export KEYTIMEOUT=1

# load user modules
for f in ~/.zshrc.d/*.zsh; do source $f; done

# load ssh-agent
pgrep ssh-agent 1> /dev/null || eval $(ssh-agent -s) 1> /dev/null

# aliases {{{
alias icat="kitty icat"

alias tm="tmux -f $HOME/.config/tmux/normal.conf new-session -As main"
alias tmw="tmux -f $HOME/.config/tmux/work.conf attach -s work"

alias la="ls -lahp --block-size=k"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias rm="/usr/bin/rm -I"
alias rmi="/usr/bin/rm -i"

alias rssp="rsync -avhz --progress"
alias rsmv="rsync -avhz --progress --remove-source-files"

alias p="pacaur --color always"
alias pm="pacman --color always"

alias z="zathura"

alias ssht="tmux-cssh -cs"

alias vim='nvim'
alias v='vim'
alias sv="sudo nvim -u ~/.vimrc"

## streams {{{
alias yt='mpv "$(xclip -selection c -o)"'
alias youtube-aria='youtube-dl --external-downloader aria2c --external-downloader-args "-c -j10 -x10 -s10"'
alias youtube-ariator='torsocks youtube-dl --external-downloader aria2c --external-downloader-args "-c -j10 -x10 -s10"'
alias soaryn="mpv ytdl://twitch.tv/soaryn"
alias amadornes="mpv ytdl://twitch.tv/amadornes"
alias poo="mpv ytdl://twitch.tv/grand_poobear"
alias waffle="mpv ytdl://twitch.tv/giantwaffle"
alias monstercat="mpv ytdl://twitch.tv/monstercat --no-video"
alias filthy="mpv ytdl://twitch.tv/filthyrobot"

## }}}
# }}}

autoload -U zmv
autoload -Uz compinit
compinit
# Completion for kitty

alias s!!="sudo !!"
# }}}

source ~/.oh-my-zshrc
