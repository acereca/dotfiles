#! /bin/bash

while getopts ":oi" opt; do
  case $opt in
    o)
      echo -e "DnD Homebrew"
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
    'DnD Homebrew') 
        i3-msg "append_layout /home/patrick/.config/i3/dnd.json; \
        exec evince /home/patrick/gitlab/dnd/homebrew.pdf; \
        exec atom /home/patrick/gitlab/dnd/";;
esac

