#!/usr/bin/env bash

now=`date +"%Y%m%d"`
dest=~/backups/${now}/

    # --dry-run \
rsync -avhW --no-compress --progress \
    --exclude=.git \
    --exclude=node_modules \
    ~/.bash* \
    ~/.zsh* \
    ~/.ssh \
    ~/.profile \
    ~/.vim* \
    ~/in \
    ~/tmp \
    ~/Downloads \
    ~/local \
    ~/Public \
    ~/refs \
    ~/projs \
    ${dest}