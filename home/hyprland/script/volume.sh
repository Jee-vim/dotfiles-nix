#!/usr/bin/env bash

# usage: ./volume.sh up|down|mute

case "$1" in
  up)
    pamixer --increase 5
    ;;
  down)
    pamixer --decrease 5
    ;;
  mute)
    pamixer --toggle-mute
    ;;
  *)
    echo "Usage: $0 up|down|mute"
    exit 1
    ;;
esac

vol=$(pamixer --get-volume-human)

if [ "$vol" = "muted" ]; then
  notify-send -a "Volume" "🔇 Muted"
else
  notify-send -a "Volume" "󰕾  Volume: $vol"
fi
