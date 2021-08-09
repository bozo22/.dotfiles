#!/bin/bash

# Remove old dotfiles

rm ~/.bashrc
rm ~/.vimrc
rm ~/.Xresources
rm ~/.config/neofetch/config.conf
rm ~/.config/bspwm/bspwmrc
rm ~/.config/sxhkd/sxhkdrc

# Make symlinks

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.Xresources ~/.Xresources
ln -s ~/.dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s ~/.dotfiles/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/.dotfiles/bspwmrc ~/.config/bspwm/bspwmrc
