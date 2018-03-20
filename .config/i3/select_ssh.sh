#! /bin/bash

TERM='/usr/local/bin/st'
EDITOR='/usr/bin/nvim'
PDFVIEW='/usr/bin/evince'

while getopts ":oi" opt; do
  case $opt in
    o)
        echo -e "home\n- raspi2\n- raspi3\n\nUni\n- hel\n- hbpc9\n- m03"
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
    "- raspi"* | "- m03" | "- hel" | "- hbpc"*)
        $TERM -e ssh ${option:2}
        ;;
esac

