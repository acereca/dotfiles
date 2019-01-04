#! /usr/bin/zsh

#in file finder
ffind() {
    if [[ $# == 2 ]]
    then
        grep -rn $1 -e $2
    else
        echo '\033[0;31m usage \033[0m: grep -rnw $1 -e $2'
    fi
}
autoload ffind