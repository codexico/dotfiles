#!/usr/bin/env bash

source ./scripts/utils.sh
source ./scripts/installs/install_with_apt.sh
source ./scripts/installs/install_with_snap.sh
source ./scripts/installs/install_from_sources.sh

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Red='\e[0;31m'
Yel='\e[0;33m'
# No Color
NC='\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CLEANING
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TODO: YES TO ALL

remove_kde_bloatware() {
    sudo apt remove --purge --auto-remove -y \
        kaddressbook kde-telepathy kmail kontact korganizer thunderbird

}
question="Do you want to remove KDE bloat software?"
if confirm "$question"; then
    remove_kde_bloatware
fi

printf "\n\n${Yel}%s${NC}\n\n" "performing system update"
sudo apt update
sudo apt upgrade -y

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BASE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

copy_dotfiles() {
    printf "${Yel}%s${NC}\n" "creating symlinks"
    ln -sv "$DOTFILES_DIR/.bash_aliases" ~/.bash_aliases
    ln -sv "$DOTFILES_DIR/.csscomb.json" ~/.csscomb.json
    ln -sv "$DOTFILES_DIR/.editorconfig" ~/.editorconfig
    ln -sv "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
    ln -sv "$DOTFILES_DIR/.gitignore_global" ~/.gitignore_global
}

question="Copy dotfiles?"
if confirm "$question"; then
    copy_dotfiles
fi

gtd_folders() {
    printf "${Yel}%s${NC}\n" "removing folders"
    rmdir ~/Documents
    rmdir ~/Music
    rmdir ~/Pictures
    rmdir ~/Templates
    rmdir ~/Videos

    printf "${Yel}%s${NC}\n" "creating gtd folders"
    # things to do
    mkdir ~/actions
    # references, files in general, support for projects -> backup regularly
    mkdir ~/refs
    # the work is done here -> backup regularly and/or be on some source control
    mkdir ~/projs
    # where it all begins
    mkdir ~/in
    # temporary files -> delete regularly
    mkdir ~/tmp
    # user scripts
    mkdir ~/bin
    # user software
    mkdir ~/opt
    # user files that dont need backup
    mkdir ~/local
}

question="Apply GTD folders?"
if confirm "$question"; then
    gtd_folders
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# INSTALL SOFTWARE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
printf "${Yel}%s${NC}\n" "Now we start installing software"

question="Install restricted extras?"
if confirm "$question"; then
    install_restricted
fi

question="Install codecs?"
if confirm "$question"; then
    install_restricted
fi

install_common_software

question="Install bat, exa and fd?"
if confirm "$question"; then
    source ./scripts/installs/install_modern_unix_commands.sh
fi

printf "${Yel}%s${NC}\n" "Now we start installing software from other sources"

question="Install Chrome?"
if confirm "$question"; then
    install_chrome
fi

question="Install Telegram?"
if confirm "$question"; then
    sudo snap install telegram-desktop
fi

question="Install Dropbox?"
if confirm "$question"; then
    install_dropbox
fi

question="Install Android Studio (using ubuntu-make)?"
if confirm "$question"; then
    install_android_studio
fi

printf "${Yel}%s${NC}\n\n" "And some software using the Snap Store"

question="Install Visual Studio Code?"
if confirm "$question"; then
    install_vscode
fi

question="Install Bitwarden (Password manager)?"
if confirm "$question"; then
    install_bitwarden
fi

printf "${Yel}%s${NC}\n" "removing files and checking if all ok"
sudo apt autoremove
sudo apt autoclean
sudo apt clean
