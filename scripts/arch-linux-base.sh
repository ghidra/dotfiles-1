#!/usr/bin/env bash

# This script is for setting up a base arch machine
# It assumes a "base base-devel" pacstrap. 

# This fixes a weird gnupg/dirmngr bug.
sudo mkdir -p /root/.gnupg/
sudo touch /root/.gnupg/dirmngr_ldapservers.conf

sudo pacman-key -r 962DDE58
sudo pacman-key -f 962DDE58
sudo pacman-key --lsign 962DDE58

sudo echo -e "[infinality-bundle]\nServer = http://bohoomil.com/repo/\$arch\n\n[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts\n" >> /etc/pacman.conf

sudo pacman -Syyu --noconfirm

sudo pacman -S --noconfirm git zsh python luakit xorg-server xorg-server-utils xorg-xinit xorg-xrandr vim curl openssh openssl sudo python2 tmux terminus-font ttf-inconsolata unzip libxcb xcb-util xcb-util-keysyms xcb-util-wm gcc make rxvt-unicode yajl expac infinality-bundle

# Create necessary config directories
mkdir -p $HOME/.config
mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.config/sxhkd

# Xorg and WM Configs
ln -s $DIR/xorg/xinitrc $HOME/.xinitrc
ln -s $DIR/xorg/Xresources $HOME/.Xresources
ln -s $DIR/wm/bspwmrc $HOME/.config/bspwm/bspwmrc
ln -s $DIR/wm/sxhkdrc $HOME/.config/sxhkd/sxhkdrc

# Make AUR repo folder
mkdir $HOME/code/aur
cd $HOME/code/aur

# Get pacaur for managing AUR packages
curl -O https://aur.archlinux.org/packages/co/cower/cower.tar.gz
curl -O https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz

tar -xzf cower.tar.gz
tar -xzf pacaur.tar.gz

cd cower
makepkg -i --noconfirm

cd ../pacaur
makepkg -i --noconfirm 

cd ..
rm -f *.tar.gz

pacaur -S --noconfirm ttf-opensans

# Get our window manager code
cd $HOME/code/repos

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

cd bspwm
make
sudo make install

cd ../sxhkd
make
sudo make install

