#!/bin/bash

# Installation

sudo reflector -c Hungary -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S bspwm sxhkd firefox rxvt-unicode ttf-jetbrains-mono archlinux-keyring bluez bluez-utils alsa-utils pulseaudio rsync networkmanager network-manager-applet xorg git base-devel polybar feh picom ntfs-3g noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-linux-libertine ttf-dejavu nm-connection-editor ranger dunst
yay -S ly otf-nerd-fonts-fira-code ksuperkey

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

bash "./configure.sh"
