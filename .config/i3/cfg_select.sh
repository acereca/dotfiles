#! /bin/bash

while getopts ":oi" opt; do
  case $opt in
    o)
      echo """i3wm
ranger keys
ranger scope
vim
zsh
livestreamer
alpine"""
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
    i3wm) termite -e "vim /home/patrick/.config/i3/config";;
    'ranger keys') termite -e "vim /home/patrick/.config/ranger/rc.conf";;
    'ranger scope') termite -e "vim /home/patrick/.config/ranger/scope.sh";;
    vim) termite -e "vim /home/patrick/.vimrc";;
    zsh) termite -e "vim /home/patrick/.zshrc";;
    livestreamer) termite -e "vim /home/patrick/.livestreamerrc";;
    alpine) termite -e "vim /home/patrick/.pinerc"
esac
