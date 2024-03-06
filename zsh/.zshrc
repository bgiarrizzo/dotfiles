#!/usr/bin/env zsh

if [ -e "${HOME}/.aliases" ]; then
    source ${HOME}/.aliases
else
    echo "-----> .aliases not found"
    echo "-----> Exiting"
    exit
fi;

if [ -e "${HOME}/.functions" ]; then
    source ${HOME}/.functions
else
    echo "-----> .functions not found"
    echo "-----> Exiting"
    exit
fi;

determine_if_codespaces_or_macos_or_linux

IS_KUBECTL_INSTALLED=$(command -v kubectl)
IS_DOCKER_INSTALLED=$(command -v docker)
IS_GCLOUD_CLI_INSTALLED=$(command -v gcloud)
IS_GITHUB_CLI_INSTALLED=$(command -v gh)
IS_HELM_INSTALLED=$(command -v helm)
IS_TERRAFORM_INSTALLED=$(command -v terraform)
IS_CONFLUENT_CLOUD_CLI_INSTALLED=$(command -v confluent)

# -------------------------------------
# BASIC CONFIG

if [ "$MACOS" ] || [ "$LINUX" ]; then
    export LC_ALL=fr_FR.UTF-8
    export LC_NUMERIC=fr_FR.UTF-8
    export LC_TIME=fr_FR.UTF-8
    export LC_COLLATE=fr_FR.UTF-8
    export LC_MONETARY=fr_FR.UTF-8
    export LC_MESSAGES=fr_FR.UTF-8
fi;

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh_custom/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cyberlife"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Without this alias, hist_stamps doesn't work
alias history='fc -il 1'

# Without this alias git commit with gpg doesn't work
export GPG_TTY=$(tty)

if [ -e "${ZSH}/oh-my-zsh.sh" ]; then
    source ${ZSH}/oh-my-zsh.sh
else
    echo "-----> ${ZSH}/oh-my-zsh.sh not found"
    echo "-----> Exiting"
    exit
fi;

# -------------------------------------
# Paths

    if [ "$MACOS" ] || [ "$LINUX" ]; then
        export PATH="$HOME/.bin/:$PATH"
    fi;

    if [ "$MACOS" ]; then
        # If you come from bash you might have to change your $PATH.
        # export PATH=$HOME/bin:/usr/local/bin:$PATH

        export PATH="$(/opt/homebrew/bin/brew --prefix)/bin/:$PATH"
        
        # Ruby
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/ruby/bin:$PATH"

        # Python
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3.10/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3.11/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3.12/bin:$PATH"
        
        # Go
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.16/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.17/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.18/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.19/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.20/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.21/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.22/bin:$PATH"

        # CLI tools
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/exa/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/bat/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/fd/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/btop/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/ncdu/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/duf/bin:$PATH"

        # SSH
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/ssh-copy-id/bin:$PATH"
    fi;

# -------------------------------------
# ZSH + useful stuff

    if [ -z "$CODESPACE" ]; then
        if [ -e "${HOME}/.cli_passwords" ]; then
            source ${HOME}/.cli_passwords
        else
            echo "-----> ${HOME}/.cli_passwords not found"
            echo "-----> Skipping"
        fi;
    fi;

    if [ "$MACOS" ] || [ "$LINUX" ]; then
        if [ "$MACOS" ]; then
            source "$(/opt/homebrew/bin/brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
            source "$(/opt/homebrew/bin/brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
        fi;
    fi;

# -------------------------------------
# ZSH Plugins

    ZSH_PLUGINS_LIST="git pipenv pip golang"

    if [ "$MACOS" ] || [ "$LINUX" ]; then

        # Use SSH and GPG agent plugins on both Macos and Linux
        ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} ssh-agent gpg-agent"

        # Use Macos plugin if on Macos
        if [ "$MACOS" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} macos"
        fi;

        # Use Linux plugin if on Linux
        if [ "$LINUX" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} debian"
        fi;

        # If CLI tools are installed, add according plugins to list
        if [ "$IS_KUBECTL_INSTALLED" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} kubectl"
        fi;
        if [ "$IS_DOCKER_INSTALLED" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} docker docker-compose"
        fi;
        if [ "$IS_GCLOUD_CLI_INSTALLED" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} gcloud"
        fi;
        if [ "$IS_GITHUB_CLI_INSTALLED" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} gh"
        fi;
        if [ "$IS_HELM_INSTALLED" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} helm"
        fi;
        if [ "$IS_TERRAFORM_INSTALLED" ]; then
            ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} terraform"
        fi;
    else
        ZSH_PLUGINS_LIST="${ZSH_PLUGINS_LIST} gh"
    fi;

    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(${ZSH_PLUGINS_LIST})

# -------------------------------------
# Google Cloud Platform

    if [ "$IS_GCLOUD_CLI_INSTALLED" ]; then
        export USE_GKE_GCLOUD_AUTH_PLUGIN=True
        if [ "$MACOS" ]; then
            # source "$(/opt/homebrew/bin/brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
            source "$(/opt/homebrew/bin/brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
        fi;
    fi;

# -------------------------------------
# Autocompletion 

    # -------------------------------------
    # Kubectl

    if [ "$IS_KUBECTL_INSTALLED" ]; then
        source <(kubectl completion zsh)
        complete -o default -F __start_kubectl k
    fi;

    # -------------------------------------
    # Helm

    if [ "$IS_HELM_INSTALLED" ]; then
        source <(helm completion zsh)
    fi;

    # -------------------------------------
    # Github CLI

    if [ "$IS_GITHUB_CLI_INSTALLED" ]; then
        source <(gh completion -s zsh)
    fi;

    # -------------------------------------
    # Confluent Cloud CLI

    if [ "$IS_CONFLUENT_CLOUD_CLI_INSTALLED" ]; then
        source <(confluent completion zsh)
    fi;

# -------------------------------------
