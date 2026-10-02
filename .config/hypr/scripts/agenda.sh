#!/usr/bin/env bash

agenda=$(
    khal list today 2d \
        --day-format "──────── {name}, {date-long} ────────" \
        --format "{start-time}  {title}" \
        --color never 2>/dev/null
)

if [[ -z "$agenda" ]]; then
    agenda="No events scheduled today or tomorrow."
fi

printf '%s\n' "$agenda" |
    rofi \
        -dmenu \
        -i \
        -p "󰃭 Agenda" \
        -mesg "Enter: close   •   Thunderbird: Super + 5"
