#!/usr/bin/env bash

# must be installed after because involves bashrc or zshrc changes

# MAYBE: function to get the last version
NVM_URL='https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh';

echo "installing node with nvm";

# install nvm
curl -o- "$NVM_URL" | bash

# source bashrc or zshrc
if [ -f "$HOME/.zshrc" ]
then
	source ~/.zshrc
else
	source ~/.bashrc
fi

# install last node
nvm install node
# set last node as default
nvm alias default node
# install some useful global packages
npm install -g http-server livereload

# source bashrc or zshrc
if [ -f "$HOME/.zshrc" ]
then
	source ~/.zshrc
else
	source ~/.bashrc
fi