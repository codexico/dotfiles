#!/usr/bin/env bash

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

install_restricted() {
    printf "${Yel}%s${NC}\n" "installing restricted software"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    echo "please accept the licenses"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    sudo apt install -y kubuntu-restricted-extras
    # > accept licenses
}

install_codecs() {
    printf "${Yel}%s${NC}\n" "installing codecs software"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    echo "please accept the licenses"
    printf "${Gre}%s${NC}\n" "$DIVIDER"
    # Codecs
    sudo apt install -y libdvd-pkg
    # > accept licenses
}

install_common_software() {
    printf "${Yel}%s${NC}\n" "installing basic software"
    sudo apt install -y chromium-browser gpodder vlc yakuake youtube-dl \
        calibre openvpn network-manager-openvpn

    printf "${Yel}%s${NC}\n" "installing development software"
    sudo apt install -y \
        git-core git-gui gitk vim curl xclip

}
