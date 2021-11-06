#!/usr/bin/env bash

filename="$HOME/.gitconfig"

read -rp "Your git user.name: " username
read -rp "Your git user.email: " useremail

# Check the new text is empty or not
if [ "$username" != "" ] && [ "$useremail" != "" ]; then
    cat <<EOF >>"$filename"

[user]
    name = $username
    email = $useremail

EOF

else
    echo "Both name and email are required, exiting.."
    exit 0
fi
