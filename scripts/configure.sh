#!/bin/bash

sudo systemctl enable ly.service             # Display manager
sudo systemctl enable betterlockscreen@$USER # Lockscreen
betterlockscreen -u $HOME/.dotfiles/res/wallpaper.jpg
