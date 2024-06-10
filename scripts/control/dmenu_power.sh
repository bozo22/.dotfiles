#!/bin/sh

case "$(echo -e "Shutdown\nReboot\nLogout\nSuspend\nLock" | dmenu \
    -i -fn "Ubuntu Mono-12")" \
    in
        Shutdown) exec systemctl poweroff;;
        Reboot) exec systemctl reboot;;
        Logout) exec i3 exit;;
        Suspend) exec systemctl suspend-then-hibernate;;
        Lock) exec betterlockscreen -l dim --off 300 --show-layout;;
esac
