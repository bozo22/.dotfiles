#!/bin/bash

# Remove old config files

rm -rf ~/{.bashrc,.vimrc,.Xresources,.ghc,.gitconfig,.zshenv,.doom.d}
sudo rm -rf /etc/systemd/{logind.conf.d,sleep.conf.d}
sudo rm -f /etc/X11/xorg.conf.d/30-touchpad.conf
rm -rf ~/.config/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh,awesome}

# Create symlinks
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/ghc ~/.ghc
ln -s ~/.dotfiles/doomemacs ~/.doom.d
sudo ln -s ~/.dotfiles/x/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp -r ~/.dotfiles/systemd/{logind.conf.d,sleep.conf.d} /etc/systemd # systemd can't see symlinks to ~ by default
ln -s ~/.dotfiles/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh,awesome} ~/.config
