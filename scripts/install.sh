#!/bin/sh

# Installation

install () {
    package_manager=$1
    package_list=$2
    if [ "$package_manager" = "pacman" ]
    then
        while read -r line;
        do
            sudo pacman -S --needed --noconfirm $line
        done < $package_list
    elif [ "$package_manager" = "yay" ]
    then
        while read -r line;
        do
            yay -S --needed --noconfirm $line
        done < $package_list
    fi
}

# Install yay

if ! yay --version &> /dev/null
then
    sudo pacman -S --needed git base-devel reflector && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    cd ..
    sudo rm -r yay
fi

# Install packages

yay -Syyuu
sudo reflector -c Hungary -a 6 --sort rate --save /etc/pacman.d/mirrorlist

install yay $HOME/.dotfiles/res/pkglist/pkglist_utils.txt
install yay $HOME/.dotfiles/res/pkglist/pkglist_wm.txt
install yay $HOME/.dotfiles/res/pkglist/pkglist_extra.txt
