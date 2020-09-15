killall polybar || echo ""

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo $m;
    MONITOR=$m polybar --reload main &
  done
  sleep 1
  xdo lower -N "Polybar"
else
  polybar --reload main &
  sleep 1
  xdo lower -N "Polybar"
fi
