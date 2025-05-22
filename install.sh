#!/bin/bash
$req = requirements.txt
$reqp = requirements-pacman.txt
$req = requirements.txt

cp -r .config/ ~/

cd ~

# Installing yay
#git clone https://aur.archlinux.org/yay-git.git
#cd yay-git/
#makepkg -si

# Removing yay-git/
#cd ..
#rm -rf yay-git/

# Installing requirements from pacman
sudo pacman -Syu --noconfirm
grep -Fx -f <(pacman -Slq) $req > $reqp
sudo pacman -S --needed - < $reqp

# Installing requirements from yay
yay -Syu --noconfirm
xargs -a $req yay -S --needed --noconfirm
