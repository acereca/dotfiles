#! /usr/bin/zsh

# find last edited file in cwd
lastedit() {
    find $1 -type f -printf '%C@ %P\n' | sort -nr | head -1 | cut -d" " -f 2-
}
autoload lastedit