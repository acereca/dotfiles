a=$(echo -e "Yes\nAbort" | rofi -dmenu -p 'Exit?')
if [ 'Yes' = '$a' ]; then
    i3-msg exit;
fi
