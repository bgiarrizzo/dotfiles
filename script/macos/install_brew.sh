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

# Install CLI stuff
brew install htop
brew install stow
brew install ssh-copy-id
brew install tree
brew install youtube-dl
brew install subliminal
# brew install unrar
brew install cheat
brew install exa
brew install fd
brew install bat
brew install btop
brew install ncdu
brew install duf

# Install Dev(ops)Stuff
brew install --cask docker
brew install terraform
brew install kubernetes-cli
brew install git-lfs
brew install git
brew install helm
brew install helmfile
brew install awscli
brew install conduktor
brew install google-cloud-sdk
brew install tig
brew install commitizen

# Install Security stuff
brew install gitleaks
brew install nmap
brew install wpscanteam/tap/wpscan

# Install useful stuff
brew install --cask iterm2
brew install --cask discord
brew install --cask transmission
brew install --cask appcleaner
brew install --cask vlc
brew install --cask slack
brew install --cask notion
brew install --cask openemu
brew install --cask lens
brew install --cask visual-studio-code
brew install --cask shadow
brew install --cask adguard
brew install --cask gimp
brew install --cask google-chrome
brew install --cask insomnia

# Install SSH agent using secure enclave
brew install --cask secretive

# Remove outdated versions from the cellar.
brew cleanup

echo -e "# ------------------------------------------------ \n\n"
echo "Install Finished"
echo "Don't forget to install the following manually :"
echo "  - Magnet"
echo "  - NewsExplorer"
echo "  - Pages"
echo "  - Numbers"
echo "  - Keynote"
echo "  - Super Agent"
echo "  - DisplayLink Manager"
echo "  - Adguard"