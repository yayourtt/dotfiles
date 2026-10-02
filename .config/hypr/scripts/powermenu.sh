#!/usr/bin/env bash

lock="  Lock"
suspend="  Suspend"
logout="󰗽  Logout"
reboot="󰜉  Reboot"
shutdown="  Shutdown"

chosen=$(printf '%s\n' \
    "$lock" \
    "$suspend" \
    "$logout" \
    "$reboot" \
    "$shutdown" |
    rofi -dmenu -i -p "Power")

case "$chosen" in
    "$lock")
        pidof hyprlock >/dev/null || hyprlock
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$logout")
        # hyprshutdown closes apps gracefully; fall back to a plain exit without it
        if command -v hyprshutdown >/dev/null 2>&1; then
            hyprshutdown
        else
            hyprctl dispatch 'hl.dsp.exit()'
        fi
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac
