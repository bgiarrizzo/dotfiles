#!/usr/bin/env bash

# Remove outdated versions from the cellar.
brew cleanup

# Install `wget`.
brew install wget

# GnuPG - to sign/encrypt mails and sign commits
brew install gnupg

# Upgrade macos tools
brew install grep

# Install CLI stuff
brew install ssh-copy-id
brew install tree

brew install --cask rar
brew install p7zip
brew install cheat
brew install eza
brew install fd
brew install bat
brew install btop
brew install ncdu
brew install duf
brew install gnu-sed
brew install watch

# Install Dev(ops)Stuff
# brew install kubernetes-cli # kubectl
brew install git-lfs
brew install git

# Desktop Mgmt Stuff
brew install yabai
brew install koekeishiya/formulae/skhd
brew install FelixKratz/formulae/sketchybar

# # Install useful stuff
brew install --cask iterm2
brew install --cask appcleaner
brew install --cask vlc
brew install --cask slack
brew install --cask insomnia
brew install yt-dlp

# # Install SSH agent using secure enclave
brew install --cask secretive

echo -e "# ------------------------------------------------ \n"
echo -e "Install Finished\n"
echo "Don't forget to install the following via :"
echo "- AppStore :"
echo "  - NewsExplorer"
echo "  - Pages"
echo "  - Numbers"
echo "  - Keynote"
echo "  - Super Agent"
echo "  - Adguard For Safari"
echo "- Docker Website :"
echo "  - Docker For Mac"
