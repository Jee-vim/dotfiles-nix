#!/bin/sh
# workspace.sh - rofi workspace switcher for River WM

# Workspace names (uncomment and edit to name your workspaces)
# WS1="1: term"
# WS2="2: web"
# WS3="3: code"
# WS4="4: chat"
# WS5="5: music"
# WS6="6: docs"
# WS7="7: vm"
# WS8="8: gfx"
# WS9="9: misc"
# WS10="10: trash"

items=""
for i in 1 2 3 4 5 6 7 8 9 10; do
  eval "label=\$WS$i"
  if [ -z "$label" ]; then
    label="$i"
  fi
  items="$items$label\n"
done

choice=$(printf "$items" | rofi -dmenu -p "workspace" -theme-str 'listview { lines: 10; }')

[ -z "$choice" ] && exit 0

ws=$(echo "$choice" | awk '{print $1}')

if [ "$ws" = "0" ]; then
  tags=512
else
  tags=$((1 << (ws - 1)))
fi

riverctl set-focused-tags "$tags"
