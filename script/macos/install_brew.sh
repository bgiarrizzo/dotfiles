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
brew reinstall --cask docker
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
brew reinstall --cask iterm2
brew reinstall --cask discord
brew reinstall --cask transmission
brew reinstall --cask appcleaner
brew reinstall --cask vlc
brew reinstall --cask slack
brew reinstall --cask notion
brew reinstall --cask lens
brew reinstall --cask visual-studio-code
brew reinstall --cask shadow
brew reinstall --cask adguard
brew reinstall --cask gimp
brew reinstall --cask google-chrome
brew reinstall --cask insomnia

# Install SSH agent using secure enclave
brew reinstall --cask secretive

# Remove outdated versions from the cellar.
brew cleanup

echo -e "# ------------------------------------------------ \n"
echo -e "Install Finished\n"
echo "Don't forget to install the following via :"
echo "- AppStore :"
echo "  - Magnet"
echo "  - NewsExplorer"
echo "  - Pages"
echo "  - Numbers"
echo "  - Keynote"
echo "  - Super Agent"
echo "  - Adguard For Safari"
echo "- Dell Website :"
echo "  - DisplayLink Manager"