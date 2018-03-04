#! /bin/bash

term = '/usb/bin/st'
EDITOR = '/usr/bin/nvim'

while getopts ":oi" opt; do
  case $opt in
    o)
        echo -e "D&D Homebrew (Atom)\nD&D Homebrew (VIM)\nReport"
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
        i3-msg "append_layout /home/patrick/.config/i3/dnd.json"
        /usr/bin/evince /home/patrick/gitlab/dnd/homebrew.pdf &
        atom /home/patrick/gitlab/dnd/ &
        ;;
    'D&D Homebrew (VIM)')
        i3-msg "append_layout /home/patrick/.config/i3/dnd_vim.json"
        /usr/bin/evince /home/patrick/gitlab/dnd/homebrew.pdf &
        ${term} -cd /home/patrick/gitlab/dnd -e ${EDITOR} +NERDTree &
        ;;
    'Report')
        i3-msg "append_layout /home/patrick/.config/i3/dnd_vim.json"
        ${term} -cd /home/patrick/gitlab/InternReport -e ${EDITOR} +NERDTree &
        /usr/bin/evince /home/patrick/gitlab/InternReport/report.pdf &
        ;;
esac

