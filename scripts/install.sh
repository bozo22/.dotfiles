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

sudo pacman -S --needed git base-devel reflector && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
sudo rm -r yay
yay -Syyuu
sudo reflector -c Hungary -a 6 --sort rate --save /etc/pacman.d/mirrorlist

install pacman $HOME/.dotfiles/res/pkglist/pkglist.txt
install yay $HOME/.dotfiles/res/pkglist/pkglist_aur.txt

chmod +x cleanup.sh
chmod +x link.sh
$HOME/.dotfiles/scripts/cleanup.sh
$HOME/.dotfiles/scripts/link.sh
