if ps ax | grep -v grep | grep polybar > /dev/null
then
    pkill polybar
else
    return
fi 

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi
