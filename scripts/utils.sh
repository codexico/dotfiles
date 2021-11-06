#!/usr/bin/env bash

confirm() {
    message="$1 [Y/n] "

    read -r -p "$message" response
    # accepts Y, y or ENTER
    if [[ $response =~ ^[Yy]$ ]] || [[ -z $response ]]; then
        return 0
    fi

    return 1
}
