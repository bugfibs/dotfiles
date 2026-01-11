#!/bin/bash

# Rofi Display Management Script for Sway
# Manages laptop (eDP-1) and external monitor (DP-1)

# Display options
options="External Only\nLaptop Only\nExtend (Laptop Left)\nExtend (Laptop Right)\nMirror Displays"

# Get user selection
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Display Setup")

case $chosen in
    "External Only")
        swaymsg output eDP-1 disable
        swaymsg output DP-1 enable pos 0 0
        notify-send "Display" "External monitor only"
        ;;
    "Laptop Only")
        swaymsg output DP-1 disable
        swaymsg output eDP-1 enable pos 0 0
        notify-send "Display" "Laptop screen only"
        ;;
    "Extend (Laptop Left)")
        swaymsg output eDP-1 enable pos 0 0
        swaymsg output DP-1 enable pos 1920 0
        notify-send "Display" "Extended: Laptop on left"
        ;;
    "Extend (Laptop Right)")
        swaymsg output DP-1 enable pos 0 0
        swaymsg output eDP-1 enable pos 1920 0
        notify-send "Display" "Extended: Laptop on right"
        ;;
    "Mirror Displays")
        swaymsg output eDP-1 enable pos 0 0
        swaymsg output DP-1 enable pos 0 0
        notify-send "Display" "Displays mirrored"
        ;;
esac
