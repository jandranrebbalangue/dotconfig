#!/usr/bin/env bash
DIR="/etc/polybar"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c "$DIR"/config.ini &
#polybar -q main2 -c "$DIR"/config.ini &

