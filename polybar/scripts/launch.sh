#!/usr/bin/env bash
# DIR="/etc/polybar"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# install autorandr first before run this script to set polybar on multiple screens
# polybar -q main -c "$DIR"/config.ini &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi

