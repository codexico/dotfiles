#!/usr/bin/env bash

source ./scripts/utils.sh

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Red='\e[0;31m'
Yel='\e[0;33m'
Gre='\e[0;32m'
# No Color
NC='\e[0m'
DIVIDER="=============================================="
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

install_restricted() {
    printf "${Yel}%s${NC}\n" "installing restricted software"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    echo "please accept the licenses"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    sudo apt install -y kubuntu-restricted-extras
    # > accept licenses
}
question="Install restricted extras?"
if confirm "$question"; then
    install_restricted
fi

install_codecs() {
    printf "${Yel}%s${NC}\n" "installing codecs software"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    echo "please accept the licenses"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    # Codecs
    sudo apt install -y libdvd-pkg
    # > accept licenses
}
question="Install codecs?"
if confirm "$question"; then
    install_restricted
fi

printf "${Yel}%s${NC}\n" "installing basic software"
sudo apt install -y chromium-browser gpodder vlc yakuake youtube-dl \
    calibre openvpn network-manager-openvpn

printf "${Yel}%s${NC}\n" "installing development software"
sudo apt install -y \
    git-core git-gui gitk vim curl xclip

printf "${Yel}%s${NC}\n" "Now we start installing software from other sources"

install_chrome() {
    printf "${Yel}%s${NC}\n" "installing Google Chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm -f google-chrome-stable_current_amd64.deb
}
question="Install Chrome?"
if confirm "$question"; then
    install_chrome
fi

install_telegram() {
    printf "${Yel}%s${NC}\n" "installing Telegram"
    curl -L -o telegram.tar.xz https://tdesktop.com/linux
    tar xf telegram.tar.xz
    mv Telegram ~/opt/Telegram/
    rm -f Telegram telegram.tar.xz
}
question="Install Telegram?"
if confirm "$question"; then
    sudo snap install telegram-desktop
fi

install_dropbox() {
    printf "${Yel}%s${NC}\n" "installing dropbox"
    sudo apt install python-gpgme
    curl -L -o dropbox.tar.gz https://www.dropbox.com/download?plat=lnx.x86_64
    tar xf dropbox.tar.gz
    mv .dropbox-dist ~/.dropbox-dist/
}
question="Install Dropbox?"
if confirm "$question"; then
    install_dropbox
fi

install_android_studio() {
    printf "${Yel}%s${NC}\n" "installing ubuntu-make"
    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
    sudo apt update
    sudo apt install ubuntu-make -y

    printf "${Yel}%s${NC}\n" "installing Android Studio"
    umake android
}
question="Install Android Studio (using ubuntu-make)?"
if confirm "$question"; then
    install_android_studio
fi

printf "${Yel}%s${NC}\n\n" "And some software using the Snap Store"

install_vscode() {
    printf "${Yel}%s${NC}\n" "installing Visual Studio Code"
    sudo snap install --classic code
}
question="Install Visual Studio Code?"
if confirm "$question"; then
    install_vscode
fi

install_bitwarden() {
    printf "${Yel}%s${NC}\n" "installing Bitwarden"
    sudo snap install bitwarden
}
question="Install Bitwarden (Password manager)?"
if confirm "$question"; then
    install_bitwarden
fi

printf "${Yel}%s${NC}\n" "removing files and checking if all ok"
sudo apt autoremove
sudo apt autoclean
sudo apt clean
