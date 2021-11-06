#!/usr/bin/env bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# COLORS
# @usage: printf "${Bla}black ${Red}red ${NC} ...\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Red='\e[0;31m'
Yel='\e[0;33m'
# No Color
NC='\e[0m'

install_telegram() {
    printf "${Yel}%s${NC}\n" "installing Telegram"
    sudo snap install telegram-desktop
}

install_vscode() {
    printf "${Yel}%s${NC}\n" "installing Visual Studio Code"
    sudo snap install --classic code
}

install_bitwarden() {
    printf "${Yel}%s${NC}\n" "installing Bitwarden"
    sudo snap install bitwarden
}
