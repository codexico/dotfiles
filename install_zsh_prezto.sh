#!/usr/bin/env bash

# prezto needs zsh already installed
echo "installing zsh";
sudo apt-get install -y zsh

# in another script to use zsh env
./install_prezto.sh
