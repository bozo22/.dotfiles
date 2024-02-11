#!/bin/bash

chmod +x $HOME/.dotfiles/scripts/setup/install.sh
chmod +x $HOME/.dotfiles/scripts/setup/link.sh
chmod +x $HOME/.dotfiles/scripts/setup/configure.sh
chmod +x $HOME/.dotfiles/scripts/setup/cleanup.sh

if [ $# -eq 1 ]; then
	$HOME/.dotfiles/scripts/setup/install.sh $1
	$HOME/.dotfiles/scripts/setup/cleanup.sh
fi
$HOME/.dotfiles/scripts/setup/link.sh
$HOME/.dotfiles/scripts/setup/configure.sh
