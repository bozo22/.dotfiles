#!/bin/bash

trap -- '' SIGINT SIGTERM SIGTSTP

chmod +x $HOME/.dotfiles/scripts/sync/install.sh
chmod +x $HOME/.dotfiles/scripts/sync/link.sh
chmod +x $HOME/.dotfiles/scripts/sync/configure.sh
chmod +x $HOME/.dotfiles/scripts/sync/cleanup.sh

verbose=0
country=""

while getopts ":vc:" opt; do
  case ${opt} in
    v)
      verbose=1
      ;;
    c)
      country=${OPTARG}
      ;;
    :)
      echo "Option -${OPTARG} requires an argument."
      exit 1
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

if [ "$country" = "" ]; then
	$HOME/.dotfiles/scripts/sync/install.sh
else
	$HOME/.dotfiles/scripts/sync/install.sh $country
fi

if [ $verbose -eq 1 ]; then
	$HOME/.dotfiles/scripts/sync/cleanup.sh
	$HOME/.dotfiles/scripts/sync/link.sh
	$HOME/.dotfiles/scripts/sync/configure.sh
else
	$HOME/.dotfiles/scripts/sync/cleanup.sh > /dev/null 2>&1
	$HOME/.dotfiles/scripts/sync/link.sh > /dev/null 2>&1
	$HOME/.dotfiles/scripts/sync/configure.sh > /dev/null 2>&1
fi

echo "Sync complete"
