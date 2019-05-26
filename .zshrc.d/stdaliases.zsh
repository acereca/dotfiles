#! /usr/bin/zsh

export DOTFILES_DIR='~/github/dotfiles'

alias chdir="cd"

# standard alias bindings
while read line; do
    if [[ $line =~ '(^.+$)' ]]; then
        l=($(echo $line | tr "\t" "\n"))
		if [[ ${l[2]} =~ ^[/~] ]];
		then alias "cf${l[1]}"="$EDITOR ${l[2]}";
		else alias "cf${l[1]}"="$EDITOR $DOTFILES_DIR/${l[2]} -c 'lcd $DOTFILES_DIR'";
		fi
    fi
done < $(dirname $0)/stdaliases

alias gh="ls -la --color ~/github && cd ~/github"
alias ghd="ls -la --color ~/github/dotfiles && cd ~/github/dotfiles"

alias gl="ls -la --color ~/gitlab && cd ~/gitlab"
alias gB="cd ~/gitlab/BaTh && ls -a && echo '' && git status"
alias gln="cd ~/gitlab/LectureNotes"

alias gD="ls -la --color ~/Downloads && cd ~/Downloads"
alias gd="ls -la --color ~/Dokumente && cd ~/Dokumente"
alias gV="ls -l --color ~/Videos && cd ~/Videos"
alias gu="ls -la --color ~/University && cd ~/University"
alias gc="ls -l --color ~/.config && cd ~/.config"
alias gt="ls -la --color ~/.local/share/Trash && cd ~/.local/share/Trash"

# aliases for work
alias gB="cd ~/gitlab/BaTh && ls -la --color"
alias gBd="cd ~/gitlab/BaTh/data && ./sshfs.sh"
