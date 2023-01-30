#!/bin/sh

# Installation

install () {
    package_manager=$1
    package_list=$2
    if [ "$package_manager" = "pacman" ]
    then
        while read -r line;
        do
            sudo pacman -S --needed $line
        done < $package_list
    elif [ "$package_manager" = "yay" ]
    then
        while read -r line;
        do
            yay -S --needed $line
        done < $package_list
    fi
}

sudo reflector -c Hungary -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
sudo rm -r yay
yay -Syyuu

install pacman $HOME/.dotfiles/res/pkglist/arch/pkglist_system.txt
install pacman $HOME/.dotfiles/res/pkglist/arch/pkglist_awesome.txt
install yay $HOME/.dotfiles/res/pkglist/arch/pkglist_aur_system.txt
install yay $HOME/.dotfiles/res/pkglist/arch/pkglist_aur_awesome.txt

if [ $1 = "full" ]
then
    install pacman $HOME/.dotfiles/res/pkglist/arch/pkglist_extra.txt
    install yay $HOME/.dotfiles/res/pkglist/arch/pkglist_aur_extra.txt
fi


chmod +x cleanup.sh
$HOME/.dotfiles/scripts/cleanup.sh
