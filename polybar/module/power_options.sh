#!/bin/bash

ARR=()
ARR+=("Log Out")
ARR+=("Restart")
ARR+=("Power Off")

CHOICE=$(printf "%s\n" "${ARR[@]}" | rofi -dmenu -config /home/blue/dotfiles/polybar/rofi/power_options -theme-str '#inputbar { enabled: false; }' -show )

case $CHOICE in
    "Log Out")
        i3-msg exit
        ;;
    "Restart")
        shutdown -r now
        ;;
    "Power Off")
        shutdown now
        ;;
esac

# shouldn't get here
exit 1
