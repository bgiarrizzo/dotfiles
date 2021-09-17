#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install a modern shell.
brew install zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# Install `wget` with IRI support.
brew install wget --with-iri

# GnuPG - to sign/encrypt mails and sign commits
brew install gnupg

# Upgrade macos tools
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install useful stuff
brew install htop
brew install stow
brew install ssh-copy-id
brew install tree
brew install youtube-dl
brew install subliminal
brew install unrar

# Install infosec tools
brew install nmap
brew install john
brew install aircrack-ng
brew install sqlmap

# Install Dev(ops)Stuff
brew install ruby
brew install python@3.8
brew install python@3.9
brew install terraform
brew install vapor
brew install kubernetes-cli
brew install ansible
brew install git-lfs
brew install git
brew install helm
brew install helmfile

# Install twitch dependency
brew install blackhole-16ch

# Remove outdated versions from the cellar.
brew cleanup