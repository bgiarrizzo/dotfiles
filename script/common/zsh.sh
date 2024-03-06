#!/usr/bin/env bash

PWD=$(pwd)

if [ -e "${PWD}/zsh/.functions" ]; then
    echo "-----> ${PWD}/zsh/.functions found"
    source ${PWD}/zsh/.functions
else
    echo "-----> ${PWD}/zsh/.functions not found"
    echo "-----> Exiting"
    exit
fi

determine_if_codespaces_or_macos_or_linux

if [ "$MACOS" ]; then
    # Install a modern shell.
    brew install zsh
    brew install zsh-syntax-highlighting
    brew install zsh-autosuggestions
fi

if [ "$LINUX" ]; then
    # Install ZSH
    apt install zsh -y
    apt install zsh-autosuggestions -y
    apt install zsh-syntax-highlighting -y
fi

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
