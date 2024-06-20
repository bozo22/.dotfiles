#!/bin/bash

crontab -r
(crontab -l 2>/dev/null; echo "0,20,40 * * * * $HOME/.dotfiles/scripts/control/play_sound.sh") | crontab -
(crontab -l 2>/dev/null; echo "@reboot $HOME/.dotfiles/scripts/control/play_sound.sh") | crontab -

sudo systemctl enable cronie.service         # Cron
sudo systemctl enable ly.service             # Display manager
sudo systemctl enable NetworkManager.service # Network manager
sudo systemctl enable bluetooth.service      # Bluetooth
sudo systemctl enable betterlockscreen@$USER # Lockscreen
sudo systemctl enable keymapperd             # Key remapper

chmod +x $HOME/.dotfiles/x/.xprofile
chmod +x $HOME/.dotfiles/scripts/ -R

sudo gpasswd -a $USER wheel
sudo chsh -s /bin/zsh $USER
