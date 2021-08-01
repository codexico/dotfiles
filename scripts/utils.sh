confirm() {
    message="$1 [Y/n] "

    read -r -p "$message" response

    if [[ $response =~ ^[Yy]$ ]] || [[ -z $response ]]; then
        return 0
    fi

    return 1
}
