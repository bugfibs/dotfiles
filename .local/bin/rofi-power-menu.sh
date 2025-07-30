#!/bin/sh
# Power menu script using rofi
CHOSEN=$(printf " - Lock\n󰤄 - Suspend\n - Reboot\n󰐥 - Shutdown\n - Log Out" | rofi -dmenu -i -p "")
case "$CHOSEN" in
	" Lock") i3lock ;;
	"Suspend") systemctl suspend ;;
	" - Reboot") systemctl reboot ;;
	"󰐥 - Shutdown") systemctl poweroff ;;
	"Log Out") i3-msg exit ;;
	*) exit 1 ;;
esac
