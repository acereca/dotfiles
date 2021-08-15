#! /bin/bash

case $1 in
    "+5")
       amixer -q -D pulse sset Master 5%+
        ;;

    "+1")
       amixer -q -D pulse sset Master 1%+
        ;;

    "-5")
       amixer -q -D pulse sset Master 5%-
        ;;

    "-1")
       amixer -q -D pulse sset Master 1%-
        ;;

    "mute")
        amixer -q -D pulse sset Master toggle
        ;;

    *)
        ;;
esac

AMIXER=$(amixer -D pulse sget Master)
VOLUME=$(echo $AMIXER | grep 'Right:' | awk -F'[][]' '{ print $2 }' | tr -d "%")
MUTE=$(echo $AMIXER | grep -o '\[off\]' | tail -n 1)
if [ "$VOLUME" -le 20 ]; then
    ICON=audio-volume-low
else if [ "$VOLUME" -le 60 ]; then
         ICON=audio-volume-medium
     else 
         ICON=audio-volume-high
     fi
fi
if [ "$MUTE" == "[off]" ]; then
    ICON=audio-volume-muted
fi

notify-send.py "Volume" "$VOLUME/100" \
                         --hint string:image-path:$ICON boolean:transient:true \
                                int:has-percentage:$VOLUME \
                         --replaces-process "volume-popup" &
