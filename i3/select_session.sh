#! /bin/bash

while getopts ":oi" opt; do
  case $opt in
    o)
        echo -e "D&D Homebrew (Atom)\nD&D Homebrew (VIM)"
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
    'D&D Homebrew (Atom)') 
        i3-msg "append_layout /home/patrick/.config/i3/dnd.json; \
        exec evince /home/patrick/gitlab/dnd/homebrew.pdf; \
        exec atom /home/patrick/gitlab/dnd/";;
    'D&D Homebrew (VIM)')
        i3-msg "append_layout /home/patrick/.config/i3/dnd_vim.json; \
        exec evince /home/patrick/gitlab/dnd/homebrew.pdf; \
        exec urxvt -cd /home/patrick/gitlab/dnd -e vim +NERDTree ";;
esac

