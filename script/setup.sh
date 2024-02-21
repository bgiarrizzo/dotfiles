#!/usr/bin/env bash

if [ -e "${HOME}/.functions" ]; then
    source ${HOME}/.functions
else
    echo "-----> .functions not found"
    echo "-----> Exiting"
    exit
fi

determine_if_codespaces_or_macos_or_linux
determine_dotfiles_dir

if [ "$CODESPACE" ]; then
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "Working in codespaces no need for brew or zsh, exiting ..."
    echo -e "\n # ------------------------------------------------------------------- #"
    exit
fi

if [ "$MACOS" ]; then 
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "installing brew ..."
    bash ${dotfiles_dir}/script/macos/brew.sh
    echo -e "\n # ------------------------------------------------------------------- #"
fi

# Brew is required to install zsh
echo -e "\n # ------------------------------------------------------------------- #"
echo "install zsh ..."
bash ${dotfiles_dir}/script/common/zsh.sh
echo -e "\n # ------------------------------------------------------------------- #"
