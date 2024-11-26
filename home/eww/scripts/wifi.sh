#!/bin/sh

# Get the connected Wi-Fi SSID using nmcli
wifi_status=$(nmcli -t -f ACTIVE,SSID dev wifi | grep -e "^yes")

if [ -n "$wifi_status" ]; then
    # Extract the SSID from the output
    ssid=$(echo "$wifi_status" | awk -F ':' '{print $2}')
    icon="󰤨" # Nerd Font Wi-Fi icon (connected)
    status="Connected to ${ssid}"
else
    icon="󰤭" # Nerd Font Wi-Fi disconnected icon
    status="Offline"
fi

# Output in JSON format
echo "{\"icon\": \"${icon}\", \"status\": \"${status}\"}"
