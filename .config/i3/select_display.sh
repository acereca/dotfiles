#!/bin/sh

choices="laptop\nlaptopdual\nclone\nManual selection"

chosen=$(echo -e "${choices}" | rofi -dmenu -p "Screen Setup")

case "$chosen" in
        laptopdual) xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1 && MODITOR=HDMI1 polybar --reload example &;;
        clone) ;;
	laptop) xrandr --output eDP1 --auto --output HDMI1 --off  && pkill -n polybar;;
	"Manual selection") arandr ;;
esac

# redo for added keyboards
setxkbmap -option caps:escape

# Relaunch polybar if there was a selection.
# [ "$chosen" == "" ] || polybar_launch
