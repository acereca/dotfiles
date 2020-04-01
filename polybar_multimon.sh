if ps ax | grep -v grep | grep polybar > /dev/null
then
    pkill polybar
else
    return
fi 

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload rome &
  done
  sleep 1
  xdo lower -N "Polybar"
else
  polybar --reload rome &
  sleep 1
  xdo lower -N "Polybar"
fi
