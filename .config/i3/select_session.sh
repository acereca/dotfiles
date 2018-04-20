#! /bin/bash

TERM='/usr/local/bin/st'
EDITOR='/usr/bin/nvim'
PDFVIEW='/usr/bin/evince'

options="D&D Homebrew\nReport"

option=$(echo -e ${options} | rofi -dmenu -p "Select Session")

case $option in
    'D&D Homebrew')
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

