#!/bin/bash

player_dir=$(find ~/ -name 'now_playing.sh')

kitten @ launch --type=os-window --tab-title "Player" --keep-focus $player_dir

hyprctl dispatch resizeactive 0 -300

kitten @ goto-layout horizontal
kitten @ launch --type=window --tab-title "Visualizer" --keep-focus cava
