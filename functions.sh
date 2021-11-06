#!/usr/bin/env bash

# ----------------------------------------------------------------------------
# Helper functions
#
# Best if sourced on .bashrc or .zshrc
#
# Ex:
# [ -f "$HOME/dotfiles/functions.sh" ] && source $HOME/dotfiles/functions.sh;
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Create directory tree for a new project
#
# Ex:
# $ proj-init cool-project
# ----------------------------------------------------------------------------
proj-init() {

	PROJS_DIR="$HOME/projs"

	mkdir -p "$PROJS_DIR/$1"
	cd "$PROJS_DIR/$1" || exit

	mkdir code     # source code repository
	mkdir w        # working files, like psd
	mkdir tmp      # temporary files
	mkdir material # original and received files from client, do not modify here

}

# ----------------------------------------------------------------------------
# cd into project code
#
# Ex:
# $ proj cool-project
# ----------------------------------------------------------------------------
proj() {
	PROJS_DIR="$HOME/projs"
	cd "$PROJS_DIR/$1/code/$1" || exit
}

# ----------------------------------------------------------------------------
# Create a directory and cd into it.
#
# Ex:
#        ~$ mkcd foo/bar    # create a "foo/bar" directory from ~
#        ~/foo/bar$         # now the  current/working directory is ~/foo/bar
# ----------------------------------------------------------------------------
mkcd() {
	mkdir -p "$@" && cd "$_" || exit
}
