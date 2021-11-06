#!/usr/bin/env bash

# Ref:
# https://github.com/ibraheemdev/modern-unix

echo "installing some utils"
sudo apt install -y bat exa fd-find

ln -s "$(which batcat)" ~/bin/bat
ln -s "$(which fdfind)" ~/bin/fd
