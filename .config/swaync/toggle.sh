#!/usr/bin/env bash
# Quick toggles for the swaync control center.
#
# Usage: toggle.sh <wifi|bluetooth> [status]
#   status  prints true/false for the button's on/off look
#   (none)  applies $SWAYNC_TOGGLE_STATE, set by swaync on click

device="$1"
action="${2:-set}"

case "$device:$action" in
    wifi:status)
        [ "$(nmcli radio wifi)" = enabled ] && echo true || echo false
        ;;
    wifi:set)
        [ "$SWAYNC_TOGGLE_STATE" = true ] && nmcli radio wifi on || nmcli radio wifi off
        ;;
    bluetooth:status)
        # bluetoothctl waits forever when bluetoothd isn't running
        timeout 1 bluetoothctl show 2>/dev/null | grep -q "Powered: yes" && echo true || echo false
        ;;
    bluetooth:set)
        if [ "$SWAYNC_TOGGLE_STATE" = true ]; then
            timeout 3 bluetoothctl power on
        else
            timeout 3 bluetoothctl power off
        fi
        ;;
esac
