
# Remove old config files

rm -rf ~/{.bashrc,.vimrc,.Xresources,.ghc,.gitconfig}
sudo rm -f /etc/default/grub
sudo rm -f /etc/bluetooth/main.conf
rm -rf ~/.config/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh}

# Create symlinks

ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.ghc ~/.ghc
sudo ln -s ~/.dotfiles/system/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s ~/.dotfiles/system/grub /etc/default/grub
sudo ln -s ~/.dotfiles/system/main.conf /etc/bluetooth
ln -s ~/.dotfiles/system/libinput-gestures.conf ~/.config/libinput-gestures.conf
for i in $dirs ; do ln -s $HOME/.dotfiles/$i $HOME/.config/$i ; done
ln -s ~/.dotfiles/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh} ~/.config

# Additional config

mkdir $HOME/screenshots
chmod go-w $HOME/.ghc/ghci.conf
