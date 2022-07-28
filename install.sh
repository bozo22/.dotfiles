#!/bin/bash

# Install the basics

#sudo pacman -S bspwm sxhkd firefox rxvt-unicode ttf-jetbrains-mono archlinux-keyring bluez bluez-utils alsa-utils pulseaudio rsync networkmanager network-manager-applet xorg git base-devel polybar feh
#yay -S ly otf-nerd-fonts-fira-code

# Install additional stuff

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Remove old dotfiles

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.Xresources
rm -f ~/.config/bspwm/bspwmrc
rm -f ~/.config/sxhkd/sxhkdrc
rm -f ~/.config/polybar/config.ini
sudo rm -f /etc/default/grub

# Create symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
mkdir -p .config/{bspwm,sxhkd,polybar}
ln -s ~/.dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/bspwm/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/.dotfiles/polybar/config.ini ~/.config/polybar/config.ini
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg

# Additional configuration
