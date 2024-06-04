#!/bin/bash

pacman -Qtdq | sudo pacman -Rns --noconfirm -
yay -Sc --noconfirm
pip cache purge
