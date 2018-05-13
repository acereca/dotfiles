#! /bin/bash

options="Deep House - FHR\nEpicMusic\nFuture House - FHR\nMA Lite\nMagicalMusic\nMonstercat\nRelaxBeats\nTropical House - FHR\n\n-> kill <-"
 
option=$(echo -e ${options} | rofi -dmenu -p 'Musik')


case $option in
    Monstercat) 
        mpv "ytdl://twitch.tv/monstercat" --ytdl-format="audio_only" & ;;
    RelaxBeats) 
        mpv "ytdl://twitch.tv/relaxbeats" --ytdl-format="audio_only" & ;;
    MagicalMusic) 
        mpv "ytdl://$(/home/patrick/github/scripts/getyturl.py user/magicalmusicchannel 'Magical Music Radio')" --vo=null & ;;
    EpicMusic) 
        mpv "ytdl://$(/home/patrick/github/scripts/getyturl.py user/epicmusicvn 'Live Stream 24/7')" --vo=null & ;;
    'MA Lite')
        mpv "ytdl://$(/home/patrick/github/scripts/getyturl.py user/MADrumandBass 'Chill w/ Us')" --vo=null & ;;
    *' - FHR')
        mpv "ytdl://$(/home/patrick/github/scripts/getyturl.py channel/UCE7gceSq79z8uW7cTe86UaA ${option% - FHR})" --vo=null & ;;
    '-> kill <-') 
        pkill mpv
        option='';;
esac

echo $option > ~/.config/mpv/nowplaying
