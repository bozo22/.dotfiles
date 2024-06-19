#!/bin/bash

# Remove old config files

rm -rf ~/{.ghc,.gitconfig,.zshenv,.xprofile,.Xresources}
sudo rm -rf /etc/systemd/{logind.conf.d,sleep.conf.d}
sudo rm -rf /usr/lib/systemd/system/betterlockscreen@.service
sudo rm -rf /etc/X11/xorg.conf.d
sudo rm -rf /etc/pacman.conf
rm -rf ~/.config/{picom,kitty,nvim,dunst,zathura,zsh,i3,keymapper.conf}
rm -rf ~/.config/autorandr/postswitch

# Create symlinks

ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/ghc ~/.ghc
ln -s ~/.dotfiles/x/.xprofile ~/.xprofile
ln -s ~/.dotfiles/x/.Xresources ~/.Xresources
ln -s ~/.dotfiles/autorandr/postswitch ~/.config/autorandr/postswitch
sudo cp -r ~/.dotfiles/systemd/{logind.conf.d,sleep.conf.d} /etc/systemd # systemd can't see symlinks to ~ by default
sudo cp -r ~/.dotfiles/systemd/modprobe.d/nobeep.conf /etc/modprobe.d/nobeep.conf # systemd can't see symlinks to ~ by default
sudo cp ~/.dotfiles/pacman/pacman.conf /etc # pacman can't see symlinks to ~ by default
sudo ln -s ~/.dotfiles/systemd/system/betterlockscreen@.service /usr/lib/systemd/system/betterlockscreen@.service
sudo ln -s ~/.dotfiles/x /etc/X11/xorg.conf.d
ln -s ~/.dotfiles/{picom,kitty,nvim,dunst,zathura,zsh,i3,keymapper/keymapper.conf} ~/.config
