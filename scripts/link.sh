
# Remove old config files

rm -rf ~/{.bashrc,.vimrc,.Xresources,.ghc,.gitconfig}
sudo rm -f /etc/default/grub
sudo rm -f /etc/bluetooth/main.conf
rm -rf ~/.config/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh,awesome}

# Create symlinks
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/urxvt/.Xresources ~/.Xresources
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.ghc ~/.ghc
sudo ln -s ~/.dotfiles/x/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
ln -s ~/.dotfiles/{bspwm,sxhkd,polybar,rofi,picom,kitty,nvim,ranger,dunst,zathura,zsh,awesome} ~/.config
test

