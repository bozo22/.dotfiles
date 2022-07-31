#!/bin/bash

# Remove old config files

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.Xresources
rm -f ~/.config/bspwm/bspwmrc
rm -f ~/.config/sxhkd/sxhkdrc
rm -f ~/.config/polybar/config.ini
sudo rm -f /etc/default/grub
rm -f ~/.config/rofi/config.rasi

# Create symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
mkdir -p .config/{bspwm,sxhkd,polybar,picom,rofi}
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/.dotfiles/polybar/config.ini ~/.config/polybar/config.ini
ln -s ~/.dotfiles/polybar/launch.sh ~/.config/polybar/launch.sh
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub
ln -s ~/.dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/.dotfiles/rofi/slate.rasi ~/.config/rofi/slate.rasi
ln -s ~/.dotfiles/system/libinput-gestures.conf ~/.config/libinput-gestures.conf

# Additional configuration

sudo systemctl enable ly.service
sudo grub-mkconfig -o /boot/grub/grub.cfg
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
sudo gpasswd -a $USER input
newgrp input
chsh -s /bin/zsh
