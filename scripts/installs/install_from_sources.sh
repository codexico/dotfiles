#!/usr/bin/env bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Red='\e[0;31m'
Yel='\e[0;33m'
# No Color
NC='\e[0m'

install_telegram_source() {
    printf "${Yel}%s${NC}\n" "installing Telegram"
    curl -L -o telegram.tar.xz https://tdesktop.com/linux
    tar xf telegram.tar.xz
    mv Telegram ~/opt/Telegram/
    rm -f Telegram telegram.tar.xz
}

install_chrome() {
    printf "${Yel}%s${NC}\n" "installing Google Chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm -f google-chrome-stable_current_amd64.deb
}

install_dropbox() {
    printf "${Yel}%s${NC}\n" "installing dropbox"
    sudo apt install python-gpgme
    curl -L -o dropbox.tar.gz https://www.dropbox.com/download?plat=lnx.x86_64
    tar xf dropbox.tar.gz
    mv .dropbox-dist ~/.dropbox-dist/
}

install_android_studio() {
    printf "${Yel}%s${NC}\n" "installing ubuntu-make"
    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
    sudo apt update
    sudo apt install ubuntu-make -y

    printf "${Yel}%s${NC}\n" "installing Android Studio"
    umake android
}
