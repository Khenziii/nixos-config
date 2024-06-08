#!/bin/sh

# get names of all the wallpapers
wallpapers=( $(ls -1 ./enabled-wallpapers) )

# get a random wallpaper
wallpapers_count=${#wallpapers[@]}
random_index=$((RANDOM % wallpapers_count))

random_wallpaper=${wallpapers[$random_index]}

# move old wallpaper out of current-wallpaper directory
mv ./current-wallpaper/* ./enabled-wallpapers

# move new wallpaper to current-wallpaper directory
mv ./enabled-wallpapers/$random_wallpaper ./current-wallpaper/

# make swww use it 
swww img ./current-wallpaper/$random_wallpaper

