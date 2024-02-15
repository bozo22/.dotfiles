#!/bin/bash

sudo systemctl enable ly.service             # Display manager
sudo systemctl enable betterlockscreen@$USER # Lockscreen

chmod +x $HOME/.dotfiles/x/.xprofile
chmod +x $HOME/.dotfiles/autorandr/postswitch
chmod +x $HOME/.dotfiles/scripts/ -R
