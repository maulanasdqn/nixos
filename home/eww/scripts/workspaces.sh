#!/bin/sh

# Function to output the workspace list
workspaces() {
    ./scripts/workspaces.lua
}

# Call workspaces function initially
workspaces

# Continuously monitor the Hyprland log file for workspace changes
tail -f /run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/hyprland.log | grep --line-buffered "dispatcher" | while read -r; do
    workspaces  # Update workspace list when workspace changes
done
