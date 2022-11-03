#!/bin/sh

# Installation

sudo reflector -c Hungary -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S --needed - < $HOME/.dotfiles/res/pkglist.txt
yay -S --needed - < $HOME/.dotfiles/res/pkglist_aur.txt
pip install pillow

chmod +x configure.sh
chmod +x cleanup.sh
$HOME/.dotfiles/scripts/configure.sh
$HOME/.dotfiles/scripts/cleanup.sh
