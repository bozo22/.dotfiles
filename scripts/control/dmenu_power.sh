#!/bin/sh

case "$(echo -e "Poweroff\nReboot\nWindows\nLock\nSuspend\nExit" | dmenu \
    -i -fn "$1")" \
    in
        Poweroff) exec systemctl poweroff;;
        Reboot) exec systemctl reboot;;
        Windows) sudo grub-reboot 1 && reboot;;
        Lock) exec betterlockscreen -l dim --off 300 --show-layout;;
        Suspend) exec systemctl suspend-then-hibernate;;
        Exit) exec i3 exit;;
esac
