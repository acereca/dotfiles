#! /bin/bash
options="i3wm\nranger keys\nranger scope\nvim\nzsh\nlivestreamer\nalpine"

option=$(echo -e ${options} | rofi -dmenu -p "Edit Config")

case $option in
    i3wm) termite -e "vim /home/patrick/.config/i3/config";;
    'ranger keys') termite -e "vim /home/patrick/.config/ranger/rc.conf";;
    'ranger scope') termite -e "vim /home/patrick/.config/ranger/scope.sh";;
    vim) termite -e "vim /home/patrick/.vimrc";;
    zsh) termite -e "vim /home/patrick/.zshrc";;
    livestreamer) termite -e "vim /home/patrick/.livestreamerrc";;
    alpine) termite -e "vim /home/patrick/.pinerc"
esac
