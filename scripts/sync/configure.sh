#!/bin/bash

sudo systemctl enable ly.service             # Display manager
sudo systemctl enable NetworkManager.service # Network manager
sudo systemctl enable bluetooth.service      # Bluetooth
sudo systemctl enable betterlockscreen@$USER # Lockscreen
sudo systemctl enable keymapperd             # Key remap

chmod +x $HOME/.dotfiles/x/.xprofile
chmod +x $HOME/.dotfiles/scripts/ -R

sudo gpasswd -a $USER wheel
