#!/bin/sh

case "$(echo -e "Poweroff\nReboot\nWindows\nExit\nLock\nSuspend" | dmenu \
    -i -fn "$1")" \
    in
        Poweroff) exec systemctl poweroff;;
        Reboot) sudo grub-reboot 0 && systemctl reboot;;
        Windows) sudo grub-reboot 1 && systemctl reboot;;
        Exit) exec i3 exit;;
        Lock) exec betterlockscreen -l dim --off 300 --show-layout;;
        Suspend) exec systemctl suspend-then-hibernate;;
esac
