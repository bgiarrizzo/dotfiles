if [ "$CODESPACES" ]; then
    dotfiles_dir="/workspaces/.codespaces/.persistedshare/dotfiles"
else
    dotfiles_dir="${HOME}/dotfiles"
fi;

copy_file() {
    source=$1
    target=$2

    if [ ! -e "$link" ]; then
        echo "-----> Copying ${source} --> ${target}"
        cp -R ${source} ${target}
    fi
}

echo "Copying all files from dotfiles repo into ${HOME} :"

for name in zsh wget vim git curl cheat; do
    for file in $(/bin/ls -A ${dotfiles_dir}/${name}/); do
        target="$HOME/$(basename $file)"
        copy_file ${dotfiles_dir}/${name}/$file ${target}
    done
done
