#!/usr/bin/env bash

# Options
options="Shutdown\nReboot\nSuspend\nLock\nLogout"

# Rofi Command
chosen="$(echo -e "$options" | rofi -dmenu -i -p "󰐥 :")"

case "$chosen" in
  *Shutdown)
    systemctl poweroff
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Suspend)
    systemctl suspend
    ;;
  *Lock)
    hyprlock
    ;;
  *Logout)
    # river: exit the compositor; fall back to killing the session
    riverctl exit || pkill -KILL -u "$USER"
    ;;
esac
