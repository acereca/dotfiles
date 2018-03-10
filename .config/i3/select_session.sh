#! /bin/bash

TERM='/usr/local/bin/st'
EDITOR='/usr/bin/nvim'
PDFVIEW='/usr/bin/evince'

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
        i3-msg "append_layout ~/.config/i3/dnd.json"
        ${PDFVIEW} ~/gitlab/dnd/homebrew.pdf &
        atom ~/gitlab/dnd/ &
        ;;
    'D&D Homebrew (VIM)')
        i3-msg "append_layout ~/.config/i3/dnd_vim.json"
        ${PDFVIEW} ~/gitlab/dnd/homebrew.pdf &
        ${TERM} -e ${EDITOR} -c 'lcd ~/gitlab/InternReport' +NERDTree &
        ;;
    'Report')
        i3-msg "append_layout ~/.config/i3/dnd_vim.json"
        ${TERM} -e ${EDITOR} -c 'lcd ~/gitlab/InternReport' +NERDTree &
        ${PDFVIEW} ~/gitlab/InternReport/report.pdf &
        ;;
esac

