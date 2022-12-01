if [ "$CODESPACES" ]; then
    echo "Copying all files from dotfiles repo into ${HOME} :"
    echo "- git"
    rsync --exclude .git -av /workspaces/.codespaces/.persistedshare/dotfiles/git/ ${HOME}/
    echo -e "Done \n"
    echo "- zsh"
    rsync --exclude .git -av /workspaces/.codespaces/.persistedshare/dotfiles/zsh/ ${HOME}/
    echo -e "Done \n"
else
    echo "Copying all files from dotfiles repo into ${HOME} :"
    echo "- git"
    rsync --exclude .git -av ${HOME}/dotfiles/git/ ${HOME}/
    echo -e "Done \n"
    echo "- zsh"
    rsync --exclude .git -av ${HOME}/dotfiles/zsh/ ${HOME}/
    echo -e "Done \n"
fi