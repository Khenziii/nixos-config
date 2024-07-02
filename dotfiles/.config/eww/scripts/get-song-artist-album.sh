#!/bin/sh

currently_playing=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

title=$(echo "$currently_playing" | awk -F '"' '/xesam:title/ {getline; print $2}')
artist=$(echo "$currently_playing" | awk -F '"' '/xesam:artist/ {getline; getline; print $2}')
album=$(echo "$currently_playing" | awk -F '"' '/xesam:album/ {getline; print $2}')

if [ "$title" = "$album" ]; then
   formatted_output="${title} by ${artist}"
else
   formatted_output="\"${title}\" from \"${album}\" by ${artist}"
fi

echo "$formatted_output"

