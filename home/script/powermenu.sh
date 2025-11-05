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
    # this will vary based on your session manager / DE / WM
    pkill -KILL -u "$USER"
    ;;
esac
