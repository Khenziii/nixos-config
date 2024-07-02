#!/bin/sh

currently_playing=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

title=$(echo "$currently_playing" | awk -F '"' '/xesam:title/ {getline; print $2}')
artist=$(echo "$currently_playing" | awk -F '"' '/xesam:artist/ {getline; getline; print $2}')
album=$(echo "$currently_playing" | awk -F '"' '/xesam:album/ {getline; print $2}')

formatted_output="\"${title}\" from \"${album}\" by ${artist}"

# If title is the same as album, or our formatted 
# string is too long, shorten it by removing the album.
if [ "$title" = "$album" ] || [ ${#formatted_output} -gt 50 ]; then
   formatted_output="\"${title}\" by ${artist}"
fi

if [ -z "$title" ]; then
    formatted_output=";)"
fi

echo "$formatted_output"

