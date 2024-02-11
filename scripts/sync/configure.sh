#!/bin/bash

sudo systemctl enable ly.service             # Display manager
sudo systemctl enable betterlockscreen@$USER # Lockscreen
betterlockscreen -u $HOME/.dotfiles/res/wallpaper.jpg --fx dim

chmod +x $HOME/.dotfiles/x/.xprofile
chmod +x $HOME/.dotfiles/autorandr/postswitch
chmod +x $HOME/.dotfiles/scripts/ -R
