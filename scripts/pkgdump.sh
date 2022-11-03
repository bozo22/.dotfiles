#!/bin/sh

pacman -Qqen > $HOME/.dotfiles/res/pkglist.txt
pacman -Qqm > $HOME/.dotfiles/res/pkglist_aur.txt
