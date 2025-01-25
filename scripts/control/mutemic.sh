#!/bin/bash

# Arbitrary but unique message tag
msgTag="microphone"

# Change the volume using alsa(might differ if you use pulseaudio)
pactl set-source-mute 0 toggle > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted
mute="$(pactl get-source-mute 0 | head -n 1)"
if [[ "$mute" == "Mute: yes" ]]; then
    # Show the sound muted notification
    dunstify -a "muteMic" -u low -h string:x-dunst-stack-tag:$msgTag "Microphone muted" -t 1000
else
    # Show the volume notification
    dunstify -a "muteMic" -u low -h string:x-dunst-stack-tag:$msgTag "Microphone enabled" -t 1000
fi
