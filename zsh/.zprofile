#!/usr/bin/env bash

source ${HOME}/.functions

determine_if_codespaces_or_macos_or_linux

if [ "$MACOS" ]; then
    eval "$($(/opt/homebrew/bin/brew --prefix)/bin/brew shellenv)"
fi
