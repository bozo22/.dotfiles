#!/bin/bash

# Remove old dotfiles

rm ~/.bahsrc
rm ~/.vimrc
rm ~/.Xresources
rm ~/.config/neofetch/config.conf

# Make symlinks

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.Xresources ~/.Xresources
ln -s ~/.dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf
