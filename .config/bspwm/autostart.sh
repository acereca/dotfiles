#! /usr/bin/sh

# Polybar
$HOME/github/dotfiles/polybar_multimon.sh

# Keybindings
pkill -SIGUSR1 sxhkd || systemctl --user restart sxhkd
setxkbmap -option compose:ralt
setxkbmap -option caps:escape

# Tablets
xsetwacom --set 18 MapToOutput 1920x1080+1920+0 # Pen
xsetwacom --set 19 MapToOutput 1920x1080+1920+0 # Touch
xsetwacom --set 20 MapToOutput 1920x1080+1920+0 # Eraser

# Compositor
killall picom; sleep .1; picom --experimental-backend &
#killall redshift; redshift &

# BG
feh --bg-fill $HOME/Pictures/bg_i3 --no-xinerama

# Lockscreen
xset s off
pkill xss-lock
xss-lock -- i3lock -t \
    -i $HOME/Pictures/bg_lock -k \
    --indpos="160:h-90" \
    --timestr="%H:%M:%S" \
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

# audio
#$HOME/.config/bspwm/audio.sh & disown


# Environment
pgrep ssh-agent 1> /dev/null || eval $(ssh-agent -s -a /run/user/1000/keyring/ssh) 1> /dev/null
export QT_QPA_PLATFORMTHEME=qt5ct
