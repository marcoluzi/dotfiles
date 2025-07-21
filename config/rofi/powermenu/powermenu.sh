#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='style-5'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`uname -n`

# Options
shutdown='󰐥 Shutdown'
reboot='󰠽 Reboot'
lock='󰌾 Lock'
logout='󰍃 Logout'
sleep='󰤄 Sleep'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${dir}/${theme}.rasi \
		-click-to-exit \
		-kb-cancel "Escape"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$logout\n$sleep\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--shutdown' ]]; then
		hyprctl dispatch closewindow all
		sleep 2
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		hyprctl dispatch closewindow all
		sleep 2
		systemctl reboot
	elif [[ $1 == '--logout' ]]; then
		killall Hyprland
	elif [[ $1 == '--lock' ]]; then
		hyprlock
	elif [[ $1 == '--sleep' ]]; then
		hyprctl dispatch closewindow all
		sleep 1
		systemctl suspend
	fi
}

# Actions
chosen="$(run_rofi)"
# Exit if user pressed Escape or clicked outside
if [[ -z "$chosen" ]]; then
    exit 0
fi

case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		hyprlock
        ;;
    $logout)
		run_cmd --logout
        ;;
    $sleep)
		run_cmd --sleep
        ;;
esac