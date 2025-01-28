#!/bin/sh

wifi_status=$(nmcli -t -f ACTIVE,SSID dev wifi | grep -e "^yes")

if [ -n "$wifi_status" ]; then
    ssid=$(echo "$wifi_status" | awk -F ':' '{print $2}')
    icon="󰤨"
    status="Connected to ${ssid}"
else
    icon="󰤭"
    status="Offline"
fi

echo "{\"icon\": \"${icon}\", \"status\": \"${status}\"}"
