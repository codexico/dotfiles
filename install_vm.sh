#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Red='\e[0;31m';
Yel='\e[0;33m';
Gre='\e[0;32m';
# No Color
NC='\e[0m';
DIVIDER="==============================================";

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CLEANING
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
printf "${Yel}removing bloat software${NC}\n${NC}\n";
sudo apt-get remove --purge --auto-remove -y \
    kaddressbook kde-telepathy kmail kontact korganizer thunderbird

printf "${Yel}performing system update${NC}\n";
sudo apt-get update
sudo apt-get upgrade -y

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BASE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
printf "${Yel}creating symlinks${NC}\n";
ln -sv "$DOTFILES_DIR/.bash_aliases" ~/.bash_aliases
ln -sv "$DOTFILES_DIR/.csscomb.json" ~/.csscomb.json
ln -sv "$DOTFILES_DIR/.editorconfig" ~/.editorconfig
ln -sv "$DOTFILES_DIR/.eslintrc" ~/.eslintrc
ln -sv "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sv "$DOTFILES_DIR/.gitignore_global" ~/.gitignore_global
ln -sv "$DOTFILES_DIR/.jshintrc" ~/.jshintrc

printf "${Yel}removing folders${NC}\n";
rmdir ~/Documents
rmdir ~/Music
rmdir ~/Pictures
rmdir ~/Templates
rmdir ~/Videos

printf "${Yel}creating gtd folders${NC}\n";
# things to do
mkdir ~/actions
# references, files in general, support for projects -> backup regularly
mkdir ~/refs
# the work is done here -> backup regularly and/or be on some source control
mkdir ~/projs
# where it all begins
mkdir ~/inbox
# temporary files -> delete regularly
mkdir ~/tmp
# user scripts
mkdir ~/bin
# user software
mkdir ~/opt
# user files that dont need backup
mkdir ~/local

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTALL SOFTWARE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
printf "${Yel}installing restricted software${NC}\n";
printf "${Gre}$DIVIDER${NC}\n";
echo "please accept the licenses";
printf "${Gre}$DIVIDER${NC}\n";
sudo apt-get install -y kubuntu-restricted-extras
# > accept licenses

printf "${Yel}installing codecs software${NC}\n";
printf "${Gre}$DIVIDER${NC}\n";
echo "please accept the licenses";
printf "${Gre}$DIVIDER${NC}\n";
# Codecs
sudo apt-get install -y libdvd-pkg
# > accept licenses

printf "${Yel}installing basic software${NC}\n";
sudo apt-get install -y chromium-browser vlc yakuake calibre

printf "${Yel}installing development software${NC}\n";
sudo apt-get install -y \
    git-core git-gui gitk vim curl

printf "${Yel}installing ubuntu-make${NC}\n";
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
sudo apt-get update
sudo apt-get install ubuntu-make -y

printf "${Yel}installing atom editor${NC}\n";
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

printf "${Yel}removing files and checking if all ok${NC}\n";
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get check
