#! /bin/bash

while getopts ":oi" opt; do
  case $opt in
    o)
      echo -e "MagicalMusic\nMonstercat\nRelaxBeats\n\n-> kill <-"
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
    Monstercat) mpv $(youtube-dl -g -f audio_only twitch.tv/monstercat ) ;;
    RelaxBeats) mpv $(youtube-dl -g -f audio_only twitch.tv/relaxbeats ) ;;
    MagicalMusic) mpv $(youtube-dl -g $(/home/patrick/github/scripts/getyturl.py user/magicalmusicchannel 'Magical Music Radio') );;
    '-> kill <-') termite -e "killall mpv";;
esac
