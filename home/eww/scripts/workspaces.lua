#!/usr/bin/env lua

-- Helper function to trim whitespace
function trim(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- Get the active workspace
local aw = io.popen("hyprctl monitors | grep active | sed 's/()/(1)/g' | sort | awk 'NR>1{print $1}' RS='(' FS=')'")
local active_workspace = trim(aw:read("*a"))
aw:close()

-- Ensure active workspace is obtained correctly
if active_workspace == "" then
  print("Error: Active workspace not found.")
  os.exit(1)
end

-- Get the list of existing workspaces
local ew = io.popen("hyprctl workspaces | grep ID | sed 's/()/(1)/g' | sort | awk 'NR>1{print $1}' RS='(' FS=')'")
local existing_workspaces = ew:read("*a")
ew:close()

-- Ensure existing workspaces are obtained correctly
if existing_workspaces == "" then
  print("Error: Existing workspaces not found.")
  os.exit(1)
end

-- Initialize the box container
local box = "(box :orientation \"v\" :spacing 1 :space-evenly \"true\" "

-- Process each workspace ID
for c in string.gmatch(existing_workspaces, "%S+") do
  local btn
  if tonumber(c) == tonumber(active_workspace) then
    -- Highlight the active workspace
    btn = "(button :class \"active\" :onclick \"hyprctl dispatch workspace " .. c .. "\" \"\")"
  else
    -- Inactive workspaces
    btn = "(button :class \"inactive\" :onclick \"hyprctl dispatch workspace " .. c .. "\" \"\")"
  end
  box = box .. btn
end

-- Close the box container
box = box .. ")"

-- Print the generated box
print(box)
