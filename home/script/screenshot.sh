#!/usr/bin/env bash

choice=$(printf "Output (file)\nRegion (file)\nRegion (clipboard)\n" | rofi -dmenu -p "󰩭  :")

mkdir -p "$HOME/Screenshots"

case "$choice" in
  "Output (file)")
    grim "$HOME/Screenshots/$(date +%s).png"
    ;;
  "Region (file)")
    grim -g "$(slurp)" "$HOME/Screenshots/$(date +%s).png"
    ;;
  "Region (clipboard)")
    grim -g "$(slurp)" - | wl-copy
    ;;
esac
