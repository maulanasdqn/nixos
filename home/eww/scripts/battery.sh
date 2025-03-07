#!/bin/sh

bat="/sys/class/power_supply/BAT0"
per="$(cat "$bat/capacity")"
status="$(cat "$bat/status")"

if [ "$status" = "Charging" ]; then
    icon="󰂄"
elif [ "$status" = "Full" ]; then
    icon="󰁹"
else
    if [ "$per" -gt "90" ]; then
        icon="󰁹"
    elif [ "$per" -gt "80" ]; then
        icon="󰂂"
    elif [ "$per" -gt "70" ]; then
        icon="󰂁"
    elif [ "$per" -gt "60" ]; then
        icon="󰂀"
    elif [ "$per" -gt "50" ]; then
        icon="󰁿"
    elif [ "$per" -gt "40" ]; then
        icon="󰁾"
    elif [ "$per" -gt "30" ]; then
        icon="󰁽"
    elif [ "$per" -gt "20" ]; then
        icon="󰁼"
    elif [ "$per" -gt "10" ]; then
        icon="󰁻"
    elif [ "$per" -gt "0" ]; then
        icon="󰂃"
    else
        icon="󰂄"
    fi
fi

if [ -s /sys/class/power_supply/BAT0/capacity ]; then
    echo "{\"percent\": \"$per\", \"icon\": \"$icon\", \"charging\": \"$status\", \"visible\": \"true\"}"
else
    echo "{\"visible\": \"false\" }"
fi
