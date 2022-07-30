#!/bin/bash

# Remove old config files

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.Xresources
rm -f ~/.config/bspwm/bspwmrc
rm -f ~/.config/sxhkd/sxhkdrc
rm -f ~/.config/polybar/config.ini
sudo rm -f /etc/default/grub

# Create symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
mkdir -p .config/{bspwm,sxhkd,polybar}
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/.dotfiles/polybar/config.ini ~/.config/polybar/config.ini
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub

# Additional configuration

sudo systemctl enable ly.service
sudo grub-mkconfig -o /boot/grub/grub.cfg
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
