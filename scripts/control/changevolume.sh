#!/bin/bash

# Arbitrary but unique message tag
msgTag="volume"

# Change the volume using alsa(might differ if you use pulseaudio)
if [[ "$@" == "toggle" ]] then
    pactl set-sink-mute @DEFAULT_SINK@ "$@" > /dev/null
else
    pactl set-sink-volume @DEFAULT_SINK@ "$@" > /dev/null
fi

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)"
mute="$(pactl get-sink-mute @DEFAULT_SINK@ | head -n 1)"
if [[ "$mute" == "Mute: yes" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" -t 1000
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%" -t 1000
fi
