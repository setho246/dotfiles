#/bin/bash
# Helper script to recreate i3's functionality of moving windows in and out of scratchpad workspace.
active_window="$(hyprctl activewindow -j)"
active_workspace=$(hyprctl activeworkspace -j | jq -r '.name')

window_workspace=$(echo $active_window | jq -r '.workspace.name')

if [[ $window_workspace == "special:scratch" ]]; then 
	hyprctl dispatch movetoworkspacesilent $active_workspace
else 
	hyprctl dispatch movetoworkspacesilent "special:scratch"
fi
