#! /usr/bin/sh

# Polybar
$HOME/github/dotfiles/polybar_multimon.sh

# Keybindings
pkill -SIGUSR1 sxhkd || systemctl --user restart sxhkd
setxkbmap -option compose:caps

# Compositor
#picom &

# BG
feh --bg-fill $HOME/Pictures/bg_i3 --no-xinerama

# Lockscreen
xset s off
pkill xss-lock
xss-lock -- i3lock -t \
    -i $HOME/Pictures/bg_lock -k \
    --timestr="%H:%M" \
    --datestr="%Y|%m|%d" -u \
    --insidecolor=ffffff00 \
    --ringcolor=ffffff00 \
    --linecolor=ffffffff \
    --separatorcolor=ffffffff \
    --keyhlcolor=ffffffff \
    --insidevercolor=ffffffff \
    --timecolor=ffffffff \
    --datecolor=ffffffff \
    --insidewrongcolor=ffffffff \
    --bshlcolor=00000000 & disown

# tray
pgrep nm-applet || nm-applet &

export QT_QPA_PLATFORMTHEME=qt5ct qt5ct
