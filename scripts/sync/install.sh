#!/bin/bash

not_found=()

# Installation

install () {
    package_manager=$1
    package_list=$2
    if [ "$package_manager" = "pacman" ]
    then
        while read -r line;
        do
            if ! sudo pacman -S --needed --noconfirm $line; then
                not_found+=("$line")
            fi
        done < $package_list
    elif [ "$package_manager" = "yay" ]
    then
        while read -r line;
        do
            output=$(yay -S --needed --noconfirm $line 2>&1 | tee /dev/stderr)
            if echo "$output" | grep -qE "No AUR package found"; then
                not_found+=("$line")
           fi
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

sudo reflector -c $1 -a 6 --sort rate --save /etc/pacman.d/mirrorlist
yay -Syyuq --noconfirm

install yay $HOME/.dotfiles/res/pkglist/pkglist_utils.txt
install yay $HOME/.dotfiles/res/pkglist/pkglist_wm.txt
install yay $HOME/.dotfiles/res/pkglist/pkglist_extra.txt

if [ ${#not_found[@]} -eq 0 ]; then
    printf "\nAll packages installed successfully\n\n"
else
    printf "\nFailed to install the following packages:\n"
    printf '%s\n' "${not_found[@]}"
    printf "\n"
fi
