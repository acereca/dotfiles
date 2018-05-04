#! /bin/bash

options="Private\nPublic"

TERM='/usr/local/bin/st'
option=$(echo -e ${options} | rofi -dmenu -p 'Mail')

case $option in
    Private) MUTTPROFILE=~/.mutt/muttrc.private.private ${TERM} -e mutt &;;
    Public) MUTTPROFILE=~/.mutt/muttrc.public.private ${TERM} -e mutt &;;
esac
