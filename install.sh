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

    if [ ! -e "${link}" ]; then
        echo "-----> Copying ${source} --> ${target}"
        cp -R ${source} ${target}
    fi;
}

erase_original_file() {
    target=$1

    echo "-----> Erasing file ${target}"
    rm -rf ${target}
}

link_file() {
    source=$1
    target=$2

    if [ ! -e "${link}" ]; then
        echo "-----> Linking ${source} --> ${target}"
        ln -s ${source} ${target}
    fi;
}

echo "Copy/link files from ${dotfiles_dir} into ${HOME} :"

for name in cheat curl git mutt vim wget zsh; do
    for file in $(/bin/ls -A ${dotfiles_dir}/${name}/); do
        source="${dotfiles_dir}/${name}/${file}"
        target="${HOME}/$(basename ${file})"

        if [ "${CODESPACE}" ]; then
            copy_file ${source} ${target}
        else
            erase_original_file ${target}
            link_file ${source} ${target}
        fi;
    done
done

for file in $(/bin/ls -A ${dotfiles_dir}/config/); do
    source="${dotfiles_dir}/config/${file}"
    target="${HOME}/.config/$(basename ${file})"

    if [ "${CODESPACE}" ]; then
        #echo "-----> Copying ${source} --> ${target}"
        copy_file ${source} ${target}
    else
        erase_original_file ${target}
        link_file ${source} ${target}
    fi;
done

echo "-----> Done"
