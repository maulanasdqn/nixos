#!/usr/bin/env lua

function trim(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

local aw = io.popen("hyprctl monitors | grep active | sed 's/()/(1)/g' | sort | awk 'NR>1{print $1}' RS='(' FS=')'")
local active_workspace = trim(aw:read("*a"))
aw:close()

if active_workspace == "" then
  print("Error: Active workspace not found.")
  os.exit(1)
end

local ew = io.popen("hyprctl workspaces | grep ID | sed 's/()/(1)/g' | sort | awk 'NR>1{print $1}' RS='(' FS=')'")
local existing_workspaces = ew:read("*a")
ew:close()

if existing_workspaces == "" then
  print("Error: Existing workspaces not found.")
  os.exit(1)
end

local box = "(box :orientation \"v\" :spacing 1 :space-evenly \"true\" "

for c in string.gmatch(existing_workspaces, "%S+") do
  local btn
  if tonumber(c) == tonumber(active_workspace) then
    btn = "(button :class \"active\" :onclick \"hyprctl dispatch workspace " .. c .. "\" \"\")"
  else
    btn = "(button :class \"inactive\" :onclick \"hyprctl dispatch workspace " .. c .. "\" \"\")"
  end
  box = box .. btn
end

box = box .. ")"

print(box)
