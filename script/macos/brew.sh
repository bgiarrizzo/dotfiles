#!/usr/bin/env bash

# Install HomeBrew

if [ -z /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add HomeBrew to PATH
    if [ grep -Fxq "/opt/homebrew/bin/brew shellenv" ~/.zprofile ]; then
        echo "line already exists"
    else
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > ~/.zprofile
    fi;
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi;

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Purge Installation
# brew remove --force $(brew list --formula)

# Remove outdated versions from the cellar.
brew cleanup
