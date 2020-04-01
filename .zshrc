# ZSH Config File
# Patrick Nisble
# github.com/acereca
#
# Last modified: 2018|12|21

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
#bindkey    "${terminfo[kcuu1]}"     history-substring-search-up
#bindkey    "${terminfo[kcud1]}"     history-substring-search-down
bindkey -v
# }}} 

# History {{{
export HISTFILE="$HOME/.cache/.zshhistory"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
# }}}

# reaction time on esc
export KEYTIMEOUT=1

# load user modules
fpath=($HOME/github/scripts/completion $fpath)
for f in $ZDOTDIR/.zshrc.d/*.zsh; do source $f; done

# load ssh-agent
pgrep ssh-agent 1> /dev/null || eval $(ssh-agent -s) 1> /dev/null

# aliases {{{
alias icat="kitty icat"

alias tm="tmux -f $HOME/.config/tmux/normal.conf new-session -As main"
alias tmw="tmux -f $HOME/.config/tmux/work.conf attach"

alias la="ls -lahp --block-size=k"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias rm="/usr/bin/rm -I"
alias rmi="/usr/bin/rm -i"

alias rssp="rsync -avhz --progress"
alias rsmv="rsync -avhz --progress --remove-source-files"

alias p="pikaur --color always"
alias pp='pikaur -S $(pikaur -Slq | fzf --ansi --preview "pikaur -Qil --color=always {} 2>/dev/null || pikaur -Si --color=always {}" --layout=reverse )'
alias pm="pacman --color always"

alias z="zathura"

alias ssht="tmux-cssh -cs"

alias vim='nvim'
alias v='nvim'
alias vu='nvim ~/github/ubib/ubib.bib -c "lcd ~/github/ubib"'
alias sv="sudo nvim"

alias sctl="sudo systemctl"
alias ctl="systemctl"

alias mux="tmuxinator"

## streams {{{
alias yt='mpv "$(xclip -selection c -o)" '
alias youtube-aria='youtube-dl --external-downloader aria2c --external-downloader-args "-c -j10 -x10 -s10"'
alias youtube-ariator='torsocks youtube-dl --external-downloader aria2c --external-downloader-args "-c -j10 -x10 -s10"'
## }}}
# }}}

autoload -U zmv

# Completion {{{
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # include hidden
# }}}

alias s!!="sudo !!"

source ~/.oh-my-zshrc
plugins=(tmux)

[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
