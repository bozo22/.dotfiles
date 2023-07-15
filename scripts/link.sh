#!/bin/bash

# Remove old config files

rm -rf ~/{.ghc,.gitconfig,.zshenv}
sudo rm -rf /etc/systemd/{logind.conf.d,sleep.conf.d}
rm -rf ~/.config/{picom,kitty,nvim,ranger,dunst,zathura,zsh,sway}

# Create symlinks
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/ghc ~/.ghc
sudo cp -r ~/.dotfiles/systemd/{logind.conf.d,sleep.conf.d} /etc/systemd # systemd can't see symlinks to ~ by default
ln -s ~/.dotfiles/{picom,kitty,nvim,ranger,dunst,zathura,zsh,sway} ~/.config
