#!/usr/bin/env sh


# ----------------------------------------------------------------------------
# Helper functions
#
# Best if sourced on .bashrc or .zshrc
# 
# Ex: 
# [ -f "$HOME/dotfiles/functions.sh" ] && source $HOME/dotfiles/functions.sh;
# ----------------------------------------------------------------------------

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

# ----------------------------------------------------------------------------
# Create directory tree for a new project
#
# Ex:
# $ proj-init cool-project
# ----------------------------------------------------------------------------
function proj-init() {

	PROJS_DIR="$HOME/projs";

	mkdir -p $PROJS_DIR/$1;
	cd $PROJS_DIR/$1;

	mkdir code; 	# source code repository
	mkdir w;		# working files, like psd
	mkdir tmp;      # temporary files
	mkdir material;	# original and received files from client, do not modify here

}

# ----------------------------------------------------------------------------
# Create a directory and cd into it.
#
# Ex:
#        ~$ mkcd foo/bar    # create a "foo/bar" directory from ~
#        ~/foo/bar$         # now the  current/working directory is ~/foo/bar
# ----------------------------------------------------------------------------
function mkcd() {
    mkdir -p "$@" && cd "$_";
}

