#!/bin/bash

# Additional configuration

mkdir $HOME/screenshots 
chmod go-w $HOME/.ghc/ghci.conf
sudo systemctl enable ly.service # display manager
sudo cp betterlockscreen@.service /usr/lib/systemd/system # betterlockscreen service
sudo systemctl enable betterlockscreen@$USER # lock screen
echo "GRUB_DISABLE_OS_PROBER=false" | sudo tee -a /etc/default/grub # enable os-prober for grub
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash loglevel=0 module_blacklist=pcspkr,snd_pcsp\"" | sudo tee -a /etc/default/grub # disable error messages on login screen & pc speaker
sudo grub-mkconfig -o /boot/grub/grub.cfg # apply grub configuration
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
sudo gpasswd -a $USER input
chmod +x ~/.dotfiles/dunst/scripts/*
newgrp input
