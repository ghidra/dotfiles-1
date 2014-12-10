#!/usr/bin/env bash

# Create user directories
mkdir $HOME/code
mkdir $HOME/code/repos
mkdir $HOME/code/aur
mkdir $HOME/downloads

# Get pacaur for managing AUR packages
cd $HOME/code/aur

curl -O https://aur.archlinux.org/packages/co/cower/cower.tar.gz
curl -O https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz

tar -xzf cower.tar.gz
tar -xzf pacaur.tzr.gz

cd cower
makepkg -i --noconfirm

cd ../pacaur
makepkg -i --noconfirm 

cd ..
rm -f *.tar.gz

# Get our window manager code
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm
make
sudo make install

cd ../sxhkd
make sudo make install

