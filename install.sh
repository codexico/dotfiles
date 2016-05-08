#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Red='\e[0;31m';
Gre='\e[0;32m';
# No Color
NC='\e[0m'
DIVIDER="==============================================";

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CLEANING
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "removing bloat software";
sudo apt-get remove --purge --auto-remove -y \
    kaddressbook kde-telepathy kmail kontact korganizer thunderbird

echo "updating";
sudo apt-get update
sudo apt-get upgrade -y

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BASE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "creating symlinks";
ln -sv "$DOTFILES_DIR/.bash_aliases" ~/.bash_aliases
ln -sv "$DOTFILES_DIR/.csscomb.json" ~/.csscomb.json
ln -sv "$DOTFILES_DIR/.editorconfig" ~/.editorconfig
ln -sv "$DOTFILES_DIR/.eslintrc" ~/.eslintrc
ln -sv "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sv "$DOTFILES_DIR/.gitignore_global" ~/.gitignore_global
ln -sv "$DOTFILES_DIR/.jshintrc" ~/.jshintrc

echo "removing folders";
rmdir ~/Documents
rmdir ~/Music
rmdir ~/Pictures
rmdir ~/Templates
rmdir ~/Videos

echo "creating gtd folders";
mkdir ~/actions
mkdir ~/refs
mkdir ~/projs
mkdir ~/inbox
mkdir ~/tmp
mkdir ~/opt
mkdir ~/local

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTALL SOFTWARE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "installing restricted software";
printf "${Gre}$DIVIDER${NC}\n";
echo "please accept the licenses";
printf "${Gre}$DIVIDER${NC}\n";
sudo apt-get install -y kubuntu-restricted-extras
# > accept licenses

echo "installing codecs software";
printf "${Gre}$DIVIDER${NC}\n";
echo "please accept the licenses";
printf "${Gre}$DIVIDER${NC}\n";
# Codecs
sudo apt-get install -y libdvd-pkg
# > accept licenses

echo "installing basic software";
sudo apt-get install -y chromium-browser gpodder skype vlc yakuake youtube-dl

echo "installing development software";
sudo apt-get install -y \
    git-core git-gui gitk vim curl \
    virtualbox virtualbox-guest-additions-iso virtualbox-guest-utils

echo "installing Google Chrome";
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
google-chrome &

echo "installing Telegram";
curl -L -o telegram.tar.xz https://tdesktop.com/linux
tar xf telegram.tar.xz
mv Telegram ~/opt/Telegram/
rm -f Telegram telegram.tar.xz
~/opt/Telegram/Telegram &

echo "installing dropbox";
curl -L -o dropbox.tar.gz https://www.dropbox.com/download?plat=lnx.x86_64
tar xf dropbox.tar.gz
mv .dropbox-dist ~/.dropbox-dist/
~/.dropbox-dist/dropboxd &

echo "installing ubuntu-make";
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
sudo apt-get update
sudo apt-get install ubuntu-make -y

echo "installing Android Studio";
umake android

echo "installing atom";
curl -L -o atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
sudo apt-get install -f -y
sudo dpkg -i atom.deb
rm -f atom.deb
printf "${Gre}$DIVIDER${NC}\n";
echo "run 'apm stars --install' to install your starred packages";
echo "you will need your token: https://atom.io/account";
printf "${Gre}$DIVIDER${NC}\n";
chromium-browser https://atom.io/account &

echo "removing files and checking if all ok";
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get check
