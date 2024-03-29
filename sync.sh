#!/bin/bash

chmod +x $HOME/.dotfiles/scripts/sync/install.sh
chmod +x $HOME/.dotfiles/scripts/sync/link.sh
chmod +x $HOME/.dotfiles/scripts/sync/configure.sh
chmod +x $HOME/.dotfiles/scripts/sync/cleanup.sh

if [ $# -eq 1 ]; then
	$HOME/.dotfiles/scripts/sync/install.sh $1
	$HOME/.dotfiles/scripts/sync/cleanup.sh
fi
$HOME/.dotfiles/scripts/sync/link.sh
$HOME/.dotfiles/scripts/sync/configure.sh
