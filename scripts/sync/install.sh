#!/bin/bash

# Installation

# Install yay

if ! yay --version &> /dev/null
then
    sudo pacman -S --needed git base-devel reflector && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    cd ..
    sudo rm -r yay
fi

# Install packages

if [ $# -eq 1 ]; then
    sudo reflector -c $1 -a 6 --sort rate --save /etc/pacman.d/mirrorlist
fi
yay -Syyuq --noconfirm
sed -e "/^[[:space:]]*$/d" -e "/^#/d" -e "s/ #.*//" $HOME/.dotfiles/res/pkglist | yay -S --needed --noconfirm -

