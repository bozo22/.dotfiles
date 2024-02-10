#!/bin/bash

# Remove old config files

rm -rf ~/{.ghc,.gitconfig,.zshenv}
sudo rm -rf /etc/systemd/{logind.conf.d,sleep.conf.d}
sudo rm -rf /etc/X11/xorg.conf.d
rm -rf ~/.config/{picom,kitty,nvim,dunst,zathura,zsh,i3}

# Create symlinks
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/ghc ~/.ghc
sudo cp -r ~/.dotfiles/systemd/{logind.conf.d,sleep.conf.d} /etc/systemd # systemd can't see symlinks to ~ by default
sudo ln -s ~/.dotfiles/x /etc/X11/xorg.conf.d
ln -s ~/.dotfiles/{picom,kitty,nvim,dunst,zathura,zsh,i3} ~/.config
