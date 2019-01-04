#! /usr/bin/zsh

# ssh + tmux
ssht() {
    ssh -t $1 "tmux $2 -A -s main"
}
autoload ssht