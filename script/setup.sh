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

if [ "$MACOS" ]; then 
    echo "installing brew ..."
    bash ${dotfiles_dir}/script/macos/install_brew.sh
fi

echo "install zsh ..."
bash ${dotfiles_dir}/script/common/zsh.sh

