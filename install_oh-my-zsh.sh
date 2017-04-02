#!/usr/bin/env bash

# check zsh
if [ "$SHELL" == "/bin/bash" ]; then
  echo "please install zsh first";
  echo "try ./install_zsh.sh";
  echo "aborting...";
elif [ "$SHELL" == "/usr/bin/zsh" ]; then
  echo "installing oh-my-zsh";
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "unknown shell, please restart and try again";
  echo "Read more: https://github.com/robbyrussell/oh-my-zsh";
fi
