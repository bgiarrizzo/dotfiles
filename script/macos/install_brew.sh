#!/usr/bin/env bash

# Install HomeBrew

if [ -z /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add HomeBrew to PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install `wget`.
brew install wget

# GnuPG - to sign/encrypt mails and sign commits
brew install gnupg

# Upgrade macos tools
# brew install vim --with-override-system-vi
brew install grep
brew install openssh

# Install useful stuff
brew install htop
brew install stow
brew install ssh-copy-id
brew install tree
brew install youtube-dl
brew install subliminal
# brew install unrar
brew install cheat

# Install Dev(ops)Stuff
brew install terraform
brew install kubernetes-cli
brew install git-lfs
brew install git
brew install helm
brew install helmfile

# Install twitch dependency
brew install blackhole-16ch

# Remove outdated versions from the cellar.
brew cleanup
