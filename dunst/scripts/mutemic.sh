#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="microphone"

# Change the volume using alsa(might differ if you use pulseaudio)
amixer set Capture "$@" > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted
mute="$(amixer get Capture | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ "$mute" == "off" ]]; then
    # Show the sound muted notification
    dunstify -a "muteMic" -u low -h string:x-dunst-stack-tag:$msgTag "Microphone muted" 
else
    # Show the volume notification
    dunstify -a "muteMic" -u low -h string:x-dunst-stack-tag:$msgTag "Microphopne enabled"
fi
