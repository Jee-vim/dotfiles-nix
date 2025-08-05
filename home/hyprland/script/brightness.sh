#!/usr/bin/env bash

# usage: ./brightness.sh up|down

case "$1" in
  up)
    brightnessctl set +5%
    ;;
  down)
    brightnessctl set 5%-
    ;;
  *)
    echo "Usage: $0 up|down"
    exit 1
    ;;
esac

bright=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( bright * 100 / max ))

notify-send -a "Brightness" "󰃟  Brightness: $percent%"
