if [ -z "$CODESPACES" ]; then
    if [ ${HOME} != "/home/vscode" ]; then
        eval "$($(/opt/homebrew/bin/brew --prefix)/bin/brew shellenv)"
    fi
fi
