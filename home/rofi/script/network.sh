#!/usr/bin/env bash

# Check current states
wifi_state=$(nmcli radio wifi)
bt_state=$(nmcli radio bluetooth)

# Format status
wifi_status="󰤨  Wi-Fi: $wifi_state"
bt_status="󰂯  Bluetooth: $bt_state"
airplane_status="   Airplane Mode"

options="$wifi_status\n$bt_status\n$airplane_status"

choice=$(echo -e "$options" | rofi -dmenu -p " :")

case "$choice" in
  *Wi-Fi*)
    if [ "$wifi_state" = "enabled" ]; then
      nmcli radio wifi off
    else
      nmcli radio wifi on
    fi
    ;;
  *Bluetooth*)
    if [ "$bt_state" = "enabled" ]; then
      nmcli radio bluetooth off
    else
      nmcli radio bluetooth on
    fi
    ;;
  *Airplane*)
    if [ "$wifi_state" = "enabled" ] || [ "$bt_state" = "enabled" ]; then
      nmcli radio all off
    else
      nmcli radio all on
    fi
    ;;
esac
