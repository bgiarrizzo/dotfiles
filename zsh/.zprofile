#!/usr/bin/env bash

if [ -e "${HOME}/.functions" ]; then
    source ${HOME}/.functions
else
    echo "-----> .functions not found"
    echo "-----> Exiting"
    exit
fi;

determine_if_codespaces_or_macos_or_linux

if [ "${MACOS}" ]; then
    eval "$($(/opt/homebrew/bin/brew --prefix)/bin/brew shellenv)"
fi;
