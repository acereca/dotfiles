#! /usr/bin/zsh

export DOTFILES_DIR='~/github/dotfiles'

alias chdir="cd"

# standard alias bindings
while read line; do
    if [[ $line =~ '(^.+$)' ]]; then
        l=($(echo $line | tr "\t" "\n"))
        alias "cf${l[1]}"="$EDITOR $DOTFILES_DIR/${l[2]} -c 'lcd $DOTFILES_DIR'"
    fi
done < $(dirname $0)/stdaliases

alias cfs="$EDITOR ~/.ssh/config"

alias cfrs="vim $DOTFILES_DIR/.config/ranger/scope.sh -c 'lcd $DOTFILES_DIR'"
alias cfrr="vim $DOTFILES_DIR/.config/ranger/rifle.conf -c 'lcd $DOTFILES_DIR'"

alias cfp="vim ~/.config/polybar/config"

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