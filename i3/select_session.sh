#! /bin/bash

while getopts ":oi" opt; do
  case $opt in
    o)
        echo -e "D&D Homebrew (Atom)\nD&D Homebrew (VIM)\nITI Mitschrieb\nReport"
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
        /usr/bin/urxvt -cd /home/patrick/gitlab/dnd -e vim +NERDTree &
        ;;
    'ITI Mitschrieb')
        i3-msg "append_layout /home/patrick/.config/i3/iti.json"
        /usr/bin/urxvt -cd /home/patrick/gitlab/ITI-WS1718 -e vim +NERDTree &
        /usr/bin/evince /home/patrick/Downloads/uni/EiTI/EiTI2016_Skript.pdf &
        atom /home/patrick/gitlab/ITI-WS1718/ &
        ;;
    'Report')
        i3-msg "append_layout /home/patrick/.config/i3/dnd_vim.json"
        /usr/bin/urxvt -cd /home/patrick/gitlab/intern_rep -e vim +NERDTree &
        /usr/bin/evince /home/patrick/gitlab/intern_rep/report.pdf &
        ;;
esac

