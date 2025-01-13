#!/usr/bin/env bash

PWD=$(pwd)

if [ -e "${PWD}/zsh/.functions" ]; then
    echo "-----> ${PWD}/zsh/.functions found"
    source ${PWD}/zsh/.functions
else
    echo "-----> ${PWD}/zsh/.functions not found"
    echo "-----> Exiting"
    exit
fi;

determine_if_codespaces_or_macos_or_linux
determine_dotfiles_dir

if [ "${CODESPACE}" ]; then
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "Working in codespaces, system ready, exiting ..."
    echo -e "\n # ------------------------------------------------------------------- #"
    exit
fi;

if [ "${MACOS}" ]; then
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "Installing brew & Prepare System ..."
    bash ${dotfiles_dir}/script/macos/brew.sh
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "Installing software ..."
    bash ${dotfiles_dir}/script/macos/software.sh
    echo -e "\n # ------------------------------------------------------------------- #"
fi;

if [ "${LINUX}" ]; then
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "Prepare System ..."
    bash ${dotfiles_dir}/script/linux/setup.sh
    echo -e "\n # ------------------------------------------------------------------- #"
    echo "Installing software ..."
    bash ${dotfiles_dir}/script/linux/software.sh
    echo -e "\n # ------------------------------------------------------------------- #"
fi;

# Brew is required to install zsh
echo -e "\n # ------------------------------------------------------------------- #"
echo "Installing ZSH ..."
bash ${dotfiles_dir}/script/common/zsh.sh
echo -e "\n # ------------------------------------------------------------------- #"
