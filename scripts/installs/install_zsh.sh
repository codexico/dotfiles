#!/usr/bin/env bash

echo "installing zsh";
sudo apt install -y zsh

echo "------";
echo "1. Run 'chsh -s $(which zsh)' to make it your default shell";
echo "2. Log out and login back again to use your new default shell";
echo "------";
