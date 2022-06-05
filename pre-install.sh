#!/bin/bash

OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
if [ ! -d "$OH_MY_ZSH_DIR" ]; then
    echo 'Installing oh-my-zsh'
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo 'oh-my-zsh is already installed'
    echo 'Updating oh-my-zsh'
    upgrade_oh_my_zsh
fi
