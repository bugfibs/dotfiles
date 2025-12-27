#!/bin/sh

CHOSEN=$(printf "󰤄 - Suspend\n - Reboot\n󰐥 - Shutdown" | rofi -dmenu -i -p "")
case "$CHOSEN" in
	"󰤄 - Suspend") systemctl suspend ;;
	" - Reboot") systemctl reboot ;;
	"󰐥 - Shutdown") systemctl poweroff ;;
	*) exit 1 ;;
esac
