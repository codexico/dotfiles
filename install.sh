#!/usr/bin/env bash

source ./scripts/utils.sh

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Red='\e[0;31m'
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

printf "\n\n${Yel}performing system update${NC}\n\n"
sudo apt update
sudo apt upgrade -y

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BASE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

copy_dotfiles() {
    printf "${Yel}creating symlinks${NC}\n"
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
    printf "${Yel}removing folders${NC}\n"
    rmdir ~/Documents
    rmdir ~/Music
    rmdir ~/Pictures
    rmdir ~/Templates
    rmdir ~/Videos

    printf "${Yel}creating gtd folders${NC}\n"
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
printf "${Yel}Now we start installing software${NC}\n"

install_restricted() {
    printf "${Yel}installing restricted software${NC}\n"
    printf "${Gre}$DIVIDER${NC}\n"
    echo "please accept the licenses"
    printf "${Gre}$DIVIDER${NC}\n"
    sudo apt install -y kubuntu-restricted-extras
    # > accept licenses
}
question="Install restricted extras?"
if confirm "$question"; then
    install_restricted
fi

install_codecs() {
    printf "${Yel}installing codecs software${NC}\n"
    printf "${Gre}$DIVIDER${NC}\n"
    echo "please accept the licenses"
    printf "${Gre}$DIVIDER${NC}\n"
    # Codecs
    sudo apt install -y libdvd-pkg
    # > accept licenses
}
question="Install codecs?"
if confirm "$question"; then
    install_restricted
fi

printf "${Yel}installing basic software${NC}\n"
sudo apt install -y chromium-browser gpodder skype vlc yakuake youtube-dl \
    calibre openvpn network-manager-openvpn

printf "${Yel}installing development software${NC}\n"
sudo apt install -y \
    git-core git-gui gitk vim curl xclip

printf "${Yel}Now we start installing software from other sources${NC}\n"

install_chrome() {
    printf "${Yel}installing Google Chrome${NC}\n"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm -f google-chrome-stable_current_amd64.deb
    google-chrome &
}
question="Install Telegram?"
if confirm "$question"; then
    install_telegram
fi

install_telegram() {
    printf "${Yel}installing Telegram${NC}\n"
    curl -L -o telegram.tar.xz https://tdesktop.com/linux
    tar xf telegram.tar.xz
    mv Telegram ~/opt/Telegram/
    rm -f Telegram telegram.tar.xz
    ~/opt/Telegram/Telegram &
}
question="Install Telegram?"
if confirm "$question"; then
    install_telegram
fi

install_dropbox() {
    printf "${Yel}installing dropbox${NC}\n"
    sudo apt install python-gpgme
    curl -L -o dropbox.tar.gz https://www.dropbox.com/download?plat=lnx.x86_64
    tar xf dropbox.tar.gz
    mv .dropbox-dist ~/.dropbox-dist/
    ~/.dropbox-dist/dropboxd &
}
question="Install Telegram?"
if confirm "$question"; then
    install_telegram
fi

install_android_studio() {
    printf "${Yel}installing ubuntu-make${NC}\n"
    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
    sudo apt update
    sudo apt install ubuntu-make -y

    printf "${Yel}installing Android Studio${NC}\n"
    umake android
}
question="Install Android Studio (using ubuntu-make)?"
if confirm "$question"; then
    install_telegram
fi

printf "${Yel}And some software using the Snap Store${NC}\n\n"

install_vscode() {
    printf "${Yel}installing Visual Studio Code${NC}\n"
    sudo snap install --classic code
}
question="Install Visual Studio Code?"
if confirm "$question"; then
    install_vscode
fi

install_bitwarden() {
    printf "${Yel}installing Bitwarden${NC}\n"
    sudo snap install bitwarden
}
question="Install Bitwarden (Password manager)?"
if confirm "$question"; then
    install_bitwarden
fi

printf "${Yel}removing files and checking if all ok${NC}\n"
sudo apt autoremove
sudo apt autoclean
sudo apt clean
