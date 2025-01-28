#!/bin/sh

workspaces() {
    ./scripts/workspaces.lua
}

workspaces

tail -f /run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/hyprland.log | grep --line-buffered "dispatcher" | while read -r; do
    workspaces
done
