#!/usr/bin/env bash

#
# This script is used to install the dotfiles on a new machine
# It doesn't use stow or any tools, just doing the copy with cp on codespaces
# or link the files to the home directory on MacOS or Linux
#


PWD=$(pwd)

if [ -e "${PWD}/zsh/.functions" ]; then
    echo "-----> ${PWD}/zsh/.functions found"
    source ${PWD}/zsh/.functions
else
    echo "-----> ${PWD}/zsh/.functions not found"
    echo "-----> Exiting"
    exit
fi;

determine_if_codespaces_or_macos_or_linux
determine_dotfiles_dir

copy_file() {
    source=$1
    target=$2

    if [ ! -e "$link" ]; then
        echo "-----> Copying ${source} --> ${target}"
        #cp -R ${source} ${target}
    fi;
}

erase_original_file() {
    target=$1

    # if target is a file, erase it
    # if target is a symlink, do nothing
    if [ -e "$target" ]; then
        echo "-----> Erasing file ${target}"
        rm -rf ${target}
    fi;
}

link_file() {
    source=$1
    target=$2

    if [ ! -e "$link" ]; then
        echo "-----> Linking ${source} --> ${target}"
        ln -s ${source} ${target}
    fi;
}

echo "Copy/link files from ${dotfiles_dir} into ${HOME} :"

for name in zsh wget vim git curl cheat; do
    for file in $(/bin/ls -A ${dotfiles_dir}/${name}/); do

        target="$HOME/$(basename $file)"

        if [ "$CODESPACE" ]; then
            copy_file ${dotfiles_dir}/${name}/$file ${target}
        else
            erase_original_file ${target}
            link_file ${dotfiles_dir}/${name}/$file ${target}
        fi;

    done
done

echo "-----> Done"
