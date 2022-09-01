#!/bin/bash

# Installation

sudo reflector -c Hungary -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S bspwm sxhkd firefox rxvt-unicode ttf-jetbrains-mono archlinux-keyring bluez bluez-utils alsa-utils pulseaudio rsync networkmanager network-manager-applet xorg git base-devel polybar feh picom ntfs-3g noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-linux-libertine ttf-dejavu nm-connection-editor ranger dunst xdotool wmctrl zsh iw zip unzip nomacs neovim pulseaudio-alsa kitty zathura zathura-pdf-mupdf python-pip highlight xclip htop ncdu
yay -S ly otf-nerd-fonts-fira-code ksuperkey libinput-gestures nitch
pip install pillow

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

chmod +x configure.sh
./configure.sh
