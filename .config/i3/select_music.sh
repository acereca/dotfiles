#! /bin/bash

options="Progressive House - FHR\nDeep House - FHR\nEpicMusic\nFuture House - FHR\nMA Lite\nMagicalMusic\nMonstercat\nMonstercat Uncaged\nMonstercat Instinct\nRelaxBeats\nTropical House - FHR\n\n-> kill <-"

option=$(echo -e ${options} | rofi -dmenu -p 'Musik')

novideo="--no-video --ytdl-format 91 "

case $option in
    'Monstercat')
        mpv "ytdl://twitch.tv/monstercat" --ytdl-format="audio_only" & ;;
    'Monstercat Uncaged')
        mpv "ytdl://$($HOME/github/scripts/getyturl.py user/MonstercatMedia 'Radio')" $novideo & ;;
    'Monstercat Instinct')
        mpv "ytdl://$($HOME/github/scripts/getyturl.py channel/UCp8OOssjSjGZRVYK6zWbNLg 'Radio')" $novideo & ;;
    RelaxBeats)
        mpv "ytdl://twitch.tv/relaxbeats" --ytdl-format="audio_only" & ;;
    MagicalMusic)
        mpv "ytdl://$($HOME/github/scripts/getyturl.py user/magicalmusicchannel 'Magical Music Radio')" $novideo & ;;
    EpicMusic)
        mpv "ytdl://$($HOME/github/scripts/getyturl.py user/epicmusicvn 'Live Stream 24/7')" $novideo & ;;
    'MA Lite')
        mpv "ytdl://$($HOME/github/scripts/getyturl.py user/MADrumandBass 'Chill w/ Us')" $novideo & ;;
    *' - FHR')
        mpv "ytdl://$($HOME/github/scripts/getyturl.py channel/UCE7gceSq79z8uW7cTe86UaA ${option% - FHR})" $novideo & ;;
    '-> kill <-')
        pkill mpv
        option='';;
esac

echo $option > ~/.config/mpv/nowplaying
