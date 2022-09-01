#!/bin/bash

# Remove old config files

rm -f ~/{.bashrc,.vimrc,.Xresources,.zshrc}
sudo rm -f /etc/default/grub
rm -rf ~/.config/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger}

# Create symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
ln -s ~/.dotfiles/bspwm ~/.config/bspwm
ln -s ~/.dotfiles/sxhkd ~/.config/sxhkd
ln -s ~/.dotfiles/polybar ~/.config/polybar
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub
ln -s ~/.dotfiles/rofi ~/.config/rofi
ln -s ~/.dotfiles/system/libinput-gestures.conf ~/.config/libinput-gestures.conf
ln -s ~/.dotfiles/kitty ~/.config/kitty
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/picom ~/.config/picom
ln -s ~/.dotfiles/ranger ~/.config/ranger

# Additional configuration

sudo systemctl enable ly.service
sudo grub-mkconfig -o /boot/grub/grub.cfg
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
sudo gpasswd -a $USER input
chmod +x $HOME/.dotfiles/{polybar/launch.sh,polybar/scripts/rofi-wifi-menu/rofi-wifi-menu.sh,polybar/scripts/rofi-bluetooth/rofi-bluetooth,cleanup.sh}

newgrp input
chsh -s /bin/zsh
