#!/bin/sh

choices="laptop\nlaptopdual\nHDMI\nManual selection"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
	laptopdual) xrandr --output LVDS-1 --auto --output VGA-1 --auto --right-of LVDS-1 ;;
	laptop) xrandr --output LVDS-1 --auto --output VGA-1 --off ;;
	VGA) xrandr --output VGA-1 --auto --output LVDS-1 --off ;;
	HDMI) xrandr --output HDMI-1 --auto --output LVDS-1 --off ;;
	"Manual selection") arandr ;;
esac

# Relaunch polybar if there was a selection.
[ "$chosen" == "" ] || polybar_launch
