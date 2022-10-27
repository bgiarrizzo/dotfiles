#!/usr/bin/env bash

echo "Moving to dotfiles folders"

cd ~/code/dotfiles;

echo $(pwd)

echo "pull last modifications of dotfiles ..."
git pull;

echo "installing brew ..."
bash script/macos/install_brew.sh

echo "install zsh ..."
bash script/macos/install_zsh.sh

# # TODO: check if .zshrc is a symlink, if not, delete it

echo "stowing dotfiles ..."
stow -t ${HOME} cheat
stow -t ${HOME} curl
stow -t ${HOME} git
stow -t ${HOME} global_config
stow -t ${HOME} vim
stow -t ${HOME} wget
stow -t ${HOME} zsh
