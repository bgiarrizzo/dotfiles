#!/usr/bin/env bash

IS_BREW_INSTALLED=$(command -v brew)

# Install HomeBrew
if [ -z ${IS_BREW_INSTALLED} ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
