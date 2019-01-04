#! /usr/bin/zsh

# rsync wrapper
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