#! /bin/sh
#notify-send "\$1=$(printf '0x%08X' "$1") \$2=$2 \$3=$3" "$4"
#xwininfo -id $1 | grep xwininfo | cut -d'"' -f2 | grep "Log" && echo 'state=floating desktop^7'
