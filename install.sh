#!/bin/bash

# Install the basics

#sudo pacman -S bspwm sxhkd firefox rxvt-unicode ttf-jetbrains-mono
#yay -S ly

# Install additional stuff

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Remove old dotfiles

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.Xresources
rm -f ~/.config/bspwm/bspwmrc
rm -f ~/.config/sxhkd/sxhkdrc
sudo rm -f /etc/default/grub

# Make symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
mkdir -p .config/{bspwm,sxhkd}
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Additional configuration
