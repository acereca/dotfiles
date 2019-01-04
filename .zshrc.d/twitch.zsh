#! /usr/bin/zsh

# wrapper for twitch streams
twitch() {
    mpv "ytdl://twitch.tv/$1" --ytdl-format=$2
}
autoload twitch