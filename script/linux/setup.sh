#!/usr/bin/env bash

# Make sure we're up to date
sudo apt update -y
sudo apt upgrade -y

# Make some cleanup (autoremove, autoclean, clean, ...)

sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y

# We're on Debian, we need to install some stuff

sudo apt install bat -y
sudo apt install btop -y
sudo apt install commitizen -y
sudo apt install tig -y
sudo apt install exa -y
