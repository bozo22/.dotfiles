#!/bin/sh

echo "Cleaning up"

pacman -Qtdq | sudo pacman -Rns -
yay -Sc
pip cache purge
