#!/usr/bin/env bash

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
ln -sv .bash_aliases ~/.bash_aliases
ln -sv .csscomb.json ~/.csscomb.json
ln -sv .editorconfig ~/.editorconfig
ln -sv .eslintrc ~/.eslintrc
ln -sv .gitconfig ~/.gitconfig
ln -sv .gitignore_global ~/.gitignore_global
ln -sv .jshintrc ~/.jshintrc

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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTALL SOFTWARE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "installing restricted software";
printf "${Gre}$DIVIDER${NC}\n";
echo "please accept the licenses";
printf "${Gre}$DIVIDER${NC}\n";
sudo apt-get install kubuntu-restricted-extras
# > accept licenses

echo "installing codecs software";
printf "${Gre}$DIVIDER${NC}\n";
echo "please accept the licenses";
printf "${Gre}$DIVIDER${NC}\n";
# Codecs
sudo apt-get install libdvdcss2
# > accept licenses

echo "installing basic software";
sudo apt-get install chromium-browser gpodder skype vlc yakuake youtube-dl

echo "installing development software";
sudo apt-get install -y \
    # git, vim, curl
    git-core git-gui vim curl \
