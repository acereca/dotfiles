#! /usr/bin/zsh

export DOTFILES_DIR='~/github/dotfiles'

alias chdir="cd"

# cfg alias bindings
while read line; do
    if [[ $line =~ '(^.+$)' ]]; then
        l=($(echo $line | tr "\t" "\n"))
		if [[ ${l[2]} =~ ^[/~] ]];
		then alias "cf${l[1]}"="$EDITOR ${l[2]}";
		else alias "cf${l[1]}"="$EDITOR $DOTFILES_DIR/${l[2]} -c 'lcd $DOTFILES_DIR'";
		fi
    fi
done < $(dirname $0)/cfg.alias

# dir alias bindings
while read line; do
    if [[ $line =~ '(^.+$)' ]]; then
        l=($(echo $line | tr "\t" "\n"))
        alias "g${l[1]}"="ls -la --color ${l[2]} && cd ${l[2]}"
    fi
done < $(dirname $0)/dir.alias
