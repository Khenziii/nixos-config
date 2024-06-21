#!/bin/sh

script_directory=~/.config/hypr/external/swww/

# get names of all the wallpapers
wallpapers=( $(ls -1 $script_directory/enabled-wallpapers) )

# get a random wallpaper
wallpapers_count=${#wallpapers[@]}
random_index=$((RANDOM % wallpapers_count))

random_wallpaper=${wallpapers[$random_index]}

# move old wallpaper out of current-wallpaper directory
mv $script_directory/current-wallpaper/* $script_directory/enabled-wallpapers

# move new wallpaper to current-wallpaper directory
mv $script_directory/enabled-wallpapers/$random_wallpaper $script_directory/current-wallpaper/

# make swww use it
swww img $script_directory/current-wallpaper/$random_wallpaper --fill-color=1e1e2e --resize=fit

