#!/bin/bash

# Additional configuration

mkdir $HOME/screenshots 
chmod go-w $HOME/.ghc/ghci.conf
sudo systemctl enable ly.service # display manager
echo "GRUB_DISABLE_OS_PROBER=false\n" | sudo tee -a /etc/default/grub # enable os-prober for grub
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash loglevel=0\"\n" | sudo tee -a /etc/default/grub # disable error messages on login screen
sudo grub-mkconfig -o /boot/grub/grub.cfg
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
sudo gpasswd -a $USER input
newgrp input
