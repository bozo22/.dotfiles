#!/bin/bash

distros=("arch")
levels=("full" "minimal")
yn=("y" "n")

# Setup

echo "Install system packages? (y/n)"
while read -p '> ' system && [[ ! " ${yn[*]} " =~ " ${system} " ]]
do
    echo "Answer y/n"
done

if [ "$system" = "y" ]
then
    echo "Choose your distro:"
    while read -p '> ' distro && [[ ! " ${distros[*]} " =~ " ${distro} " ]]
    do
        echo "Enter a valid distro. Possible choices: $distros"
    done

    echo "Choose the installation level (full/minimal):"
    while read -p '> ' level && [[ ! " ${levels[*]} " =~ " ${level} " ]]
    do
        echo "Enter full or minimal."
    done
fi

echo "Install and configure Haskell? (y/n)"
while read -p '> ' haskell && [[ ! " ${yn[*]} " =~ " ${haskell} " ]]
do
    echo "Answer y/n"
done

if [ "$haskell" = "y" ]
then
    echo "Install and configure Agda? (y/n)"
    while read -p '> ' agda && [[ ! " ${yn[*]} " =~ " ${agda} " ]]
    do
        echo "Answer y/n"
    done
fi

# Installation

if [ "$system" = "y" ]
then
    if [ "$distro" = "arch" ]
    then
        chmod +x $HOME/.dotfiles/install/arch/install.sh
        $HOME/.dotfiles/install/arch/install.sh $level
    fi

    pip install pillow # ranger image preview
fi

if [ "$haskell" = "y" ]
then
    ghcup install ghc 9.4.4
    ghcup set ghc 9.4.4
    ghcup install cabal
    ghcup set cabal
    cabal update

    if [ "$agda" = "y" ]
    then
        cabal install Agda
        agda-mode setup
    fi
fi


chmod +x $HOME/.dotfiles/install/link.sh
chmod +x $HOME/.dotfiles/install/configure.sh
$HOME/.dotfiles/install/link.sh
$HOME/.dotfiles/install/configure.sh
