#! /bin/bash

while getopts ":oi" opt; do
  case $opt in
    o)
      echo -e "MagicalMusic\nMA Lite\nMonstercat\nRelaxBeats\nEpicMusic\n\n-> kill <-"
      ;;
    i)
      while read LINE; do
        option=${LINE}
      done
      echo -e ${option} >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done


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
    '-> kill <-') 
        pkill mpv
        option='';;
esac

echo $option > ~/.config/mpv/nowplaying
