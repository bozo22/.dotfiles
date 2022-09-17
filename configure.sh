#!/bin/bash

# Remove old config files

rm -rf ~/{.bashrc,.vimrc,.Xresources,.ghc}
sudo rm -f /etc/default/grub
sudo rm -f /etc/bluetooth/main.conf
rm -rf ~/.config/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh}

# Create symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
ln -s ~/.dotfiles/.ghc ~/.ghc
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub
sudo ln -s ~/.dotfiles/system/main.conf /etc/bluetooth
ln -s ~/.dotfiles/system/libinput-gestures.conf ~/.config/libinput-gestures.conf
for i in $dirs ; do ln -s $HOME/.dotfiles/$i $HOME/.config/$i ; done
ln -s ~/.dotfiles/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh} ~/.config

# Additional configuration

sudo systemctl enable ly.service
sudo grub-mkconfig -o /boot/grub/grub.cfg
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
sudo gpasswd -a $USER input
if [ ! -f $HOME/.dotfiles/private.sh ] ; then touch $HOME/.dotfiles/private.sh && echo '#!/bin/bash' > $HOME/.dotfiles/private.sh ; fi
chmod +x $HOME/.dotfiles/{polybar/launch.sh,polybar/scripts/rofi-wifi-menu/rofi-wifi-menu.sh,polybar/scripts/rofi-bluetooth/rofi-bluetooth,cleanup.sh,private.sh,system/bluetooth.sh}
chmod go-w $HOME/.ghc/ghci.conf
mkdir $HOME/screenshots
sudo -E hardcode-tray --conversion-tool RSVGConvert --size 22 --theme Papirus
git config --global credential.helper store

newgrp input
chsh -s /bin/zsh
