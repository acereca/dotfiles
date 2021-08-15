#!/bin/bash

led_file=/sys/class/leds/input*$1/brightness
old=$(cat $led_file)
echo -n $(($old ^ 1)) > $led_file

case $1 in
    r)
        if [ $old -eq 1 ]
        then
            pactl set-source-mute 1 0
            notify-send.py "Unmuting Microphone" -a "pactl" --hint string:image-path:discord-tray-muted
        else
            pactl set-source-mute 1 1
            notify-send.py "Muting Microphone" -a "pactl" --hint string:image-path:discord-tray-muted
        fi
        ;;

    3)
        if [ $old -eq 1 ]
        then
            kill $(cat /tmp/.ipw.pid)
            notify-send.py "Stopped IPWebcam" -a "[$(cat /tmp/.ipw.pid)]" --hint string:image-path:camera-off --replaces-process "script/ipw"
        else
            $HOME/github/scripts/ipw.sh &
            echo $! > /tmp/.ipw.pid
            notify-send.py "Started IPWebcam" -a "[$!]" --hint string:image-path:camera-on --replaces-process "script/ipw"
        fi
        ;;

    *)
        ;;
esac
