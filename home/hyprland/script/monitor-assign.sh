#!/usr/bin/env bash
INT="eDP-1"              # ${settings.monitor.internal}
EXT="HDMI-A-1"           # ${settings.monitor.external}

# Is the external actually present?
if hyprctl monitors -j | jq -e ".[] | select(.name==\"$EXT\")" >/dev/null; then
    hyprctl keyword workspace "6, monitor:$EXT"
    hyprctl dispatch moveworkspacetomonitor 6 "$EXT"
else
    hyprctl keyword workspace "6, monitor:$INT"
    hyprctl dispatch moveworkspacetomonitor 6 "$INT"
fi
