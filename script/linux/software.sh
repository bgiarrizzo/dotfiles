#!/usr/bin/env bash

apt autoremove -y
apt autoclean -y
apt clean -y

echo "Update cache"

apt update -y

echo "Install softwares"

# Install CLI Stuff
apt install curl -y
apt install btop -y
apt install duf -y
apt install tree -y
apt install eza -y
apt install ncdu -y
apt install ripgrep -y
apt install xclip -y
apt install luarocks -y

# Install Dev/Sec/Ops Stuff
apt install git -y
apt install neovim -y
apt install nmap -y
apt install docker.io -y

# Install useful Stuff
apt install terminator -y
apt install vlc -y
apt install yt-dlp -y
apt install weechat -y
apt install tmux -y

# Install Github CLI 
mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) \
    && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y

# -----------------------------------------------------------------------------
# Install Latest Python

echo "Install Python"

apt install python3 -y
apt install python3-pip -y

# Install Python Packages
pip3 install --upgrade pip setuptools wheel pipenv poetry
pip3 install --upgrade black flake8 isort mypy pytest pylint neovim debugpy

# -----------------------------------------------------------------------------
# Install Nerd Fonts

echo "Install Hack Nerd Fonts"

bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"

# -----------------------------------------------------------------------------

echo "Clean up the system"

pip3 cache purge

apt autoremove -y
apt autoclean -y
apt clean -y
