#!/bin/bash

crontab -r
(crontab -l 2>/dev/null; echo "0,20,40 * * * * $HOME/.dotfiles/scripts/control/play_sound.sh") | crontab -
(crontab -l 2>/dev/null; echo "@reboot $HOME/.dotfiles/scripts/control/play_sound.sh") | crontab -

sudo systemctl enable -q cronie.service         # Cron
sudo systemctl enable -q ly.service             # Display manager
sudo systemctl enable -q NetworkManager.service # Network manager
sudo systemctl enable -q bluetooth.service      # Bluetooth
sudo systemctl enable -q betterlockscreen@$USER # Lockscreen
sudo systemctl enable -q keymapperd             # Key remapper

chmod +x $HOME/.dotfiles/x/.xprofile
chmod +x $HOME/.dotfiles/scripts/ -R

sudo gpasswd -a $USER wheel
sudo chsh -s /bin/zsh $USER
