#!/bin/bash

echo "Syncing configuration..."

chmod +x $HOME/.dotfiles/scripts/install.sh
chmod +x $HOME/.dotfiles/scripts/link.sh
chmod +x $HOME/.dotfiles/scripts/configure.sh
chmod +x $HOME/.dotfiles/scripts/cleanup.sh

$HOME/.dotfiles/scripts/install.sh
$HOME/.dotfiles/scripts/link.sh
$HOME/.dotfiles/scripts/configure.sh
$HOME/.dotfiles/scripts/cleanup.sh

echo "Sync complete"
