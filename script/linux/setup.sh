#!/usr/bin/env bash

unstable_switch_prompt() {
    echo "Do you want to switch to debian unstable? (y/n)"
    read -r response
}

unstable_switch_prompt

while [ "$response" != "y" ] && [ "$response" != "yes" ] && [ "$response" != "n" ] && [ "$response" != "no" ]; do
    echo "Invalid response. Please enter 'y' or 'n'"
    unstable_switch_prompt
done

if [ "$response" = "y" ] || [ "$response" = "yes" ]; then
    echo "Switching to debian unstable"
    echo "deb http://deb.debian.org/debian/ unstable main non-free-firmware contrib non-free" > /etc/apt/sources.list
elif [ "$response" = "n" ] || [ "$response" = "no" ]; then
    echo "Not switching to debian unstable"
fi

echo "Disable install-recommends and install-suggests"

cat <<EOF > /etc/apt/apt.conf.d/99no-recommends
APT::Install-Recommends "false";
APT::Install-Suggests "false";
EOF

# -----------------------------------------------------------------------------
# Make sure we're up to date

echo "Update and upgrade the system"

apt update -y
apt upgrade -y

# -----------------------------------------------------------------------------
# Make some cleanup (autoremove, autoclean, clean, ...)

echo "Clean up the system"

apt autoremove -y
apt autoclean -y
apt clean -y
