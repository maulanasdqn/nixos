#!/bin/sh

bat="/sys/class/power_supply/BAT0"
per="$(cat "$bat/capacity")"
status="$(cat "$bat/status")"

# Set appropriate Nerd Font icons based on battery percentage
if [ "$status" = "Charging" ]; then
    icon="󰂅" # Charging icon
elif [ "$status" = "Full" ]; then
    icon="󰁹" # Full battery icon
else
    # If not charging and not full, determine the icon based on the percentage
    if [ "$per" -gt "90" ]; then
        icon="󰁹" # Battery Full
    elif [ "$per" -gt "80" ]; then
        icon="󰂂" # Battery 80%
    elif [ "$per" -gt "70" ]; then
        icon="󰂁" # Battery 70%
    elif [ "$per" -gt "60" ]; then
        icon="󰂀" # Battery 60%
    elif [ "$per" -gt "50" ]; then
        icon="󰁿" # Battery 50%
    elif [ "$per" -gt "40" ]; then
        icon="󰁾" # Battery 40%
    elif [ "$per" -gt "30" ]; then
        icon="󰁽" # Battery 30%
    elif [ "$per" -gt "20" ]; then
        icon="󰁼" # Battery 20%
    elif [ "$per" -gt "10" ]; then
        icon="󰁻" # Battery 10%
    elif [ "$per" -gt "0" ]; then
        icon="󰂃" # Battery Empty
    else
        icon="󰂄" # Battery Unknown/Error
    fi
fi

# Output JSON format
if [ -s /sys/class/power_supply/BAT0/capacity ]; then
    echo "{\"percent\": \"$per\", \"icon\": \"$icon\", \"charging\": \"$status\", \"visible\": \"true\"}"
else
    echo "{\"visible\": \"false\" }"
fi
