#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="brightness"

# Change the volume using alsa(might differ if you use pulseaudio)
xbacklight "$@" > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted
brightness="$(xbacklight | tr "." "\n" | head -1)"
    # Show the brighness notification
    dunstify -a "changeBrightness" -u low -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$brightness" "Brightness: ${brightness}%"
