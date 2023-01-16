#!/bin/sh

# Additional configuration

sudo systemctl enable ly.service
sudo grub-mkconfig -o /boot/grub/grub.cfg
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc
sudo gpasswd -a $USER input
if [ ! -f $HOME/.dotfiles/scripts/private.sh ] ; then touch $HOME/.dotfiles/scripts/private.sh && echo '#!/bin/sh' > $HOME/.dotfiles/scripts/private.sh ; fi
chmod +x $HOME/.dotfiles/{polybar/launch.sh,polybar/scripts/rofi-wifi-menu/rofi-wifi-menu.sh,polybar/scripts/rofi-bluetooth/rofi-bluetooth,scripts/private.sh,scripts/pkgdump.sh,system/bluetooth.sh}
newgrp input
chsh -s /bin/zsh
