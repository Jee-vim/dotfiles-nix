#!/usr/bin/env bash

choice=$(printf "Output (file)\nRegion (file)\nRegion (clipboard)\n" | rofi -dmenu -p "󰩭  :")

case "$choice" in
  "Output (file)")
    hyprshot -m output -o "$HOME/Screenshots"
    ;;
  "Region (file)")
    hyprshot -m region -o "$HOME/Screenshots"
    ;;
  "Region (clipboard)")
    hyprshot -m region --clipboard-only
    ;;
esac
