#!/bin/bash

function not_in_list() {
    LIST=$1
    DELIMITER=" "
    VALUE=$3
    LIST_WHITESPACES=`echo $LIST | tr "$DELIMITER" " "`
    for x in $LIST_WHITESPACES; do
        if [ "$x" = "$VALUE" ]; then
            return 1
        fi
    done
    return 0
}

distros=("arch")
levels=("full" "minimal")

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

if [ "$distro" = "arch" ]
then
  chmod +x $HOME/.dotfiles/install/arch/install.sh
  $HOME/.dotfiles/install/arch/install.sh $level
fi

pip install pillow

chmod +x $HOME/.dotfiles/install/link.sh
chmod +x $HOME/.dotfiles/install/configure.sh
$HOME/.dotfiles/install/link.sh
$HOME/.dotfiles/install/configure.sh
