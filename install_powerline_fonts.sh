#!/usr/bin/env bash

echo "installing powerline fonts";
git clone https://github.com/powerline/fonts.git tmpfonts
./tmpfonts/install.sh
rm -rf tmpfonts
