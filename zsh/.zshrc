# BASIC CONFIG

if [ -z "$CODESPACES" ]; then
    export LC_ALL=fr_FR.UTF-8
    export LC_NUMERIC=fr_FR.UTF-8
    export LC_TIME=fr_FR.UTF-8
    export LC_COLLATE=fr_FR.UTF-8
    export LC_MONETARY=fr_FR.UTF-8
    export LC_MESSAGES=fr_FR.UTF-8
fi

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
HIST_STAMPS="yyyy/mm/dd"

# Without this alias, hist_stamps doesn't work
alias history='fc -il 1'

# Without this alias git commit with gpg doesn't work
export GPG_TTY=$(tty)

source $ZSH/oh-my-zsh.sh

if [ ${HOME} != "/home/vscode" ]; then
    source ~/.cli_passwords
fi

if [ -z "$CODESPACES" ]; then
    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(ssh-agent gpg-agent git pipenv)
    if [ ${HOME} != "/home/vscode" ]; then
        source "$(/opt/homebrew/bin/brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
        source "$(/opt/homebrew/bin/brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    fi
fi


# -------------------------------------
# Google Cloud Platform

if [ -z "$CODESPACES" ]; then
    if [ ${HOME} != "/home/vscode" ]; then
        export USE_GKE_GCLOUD_AUTH_PLUGIN=True
        # source "$(/opt/homebrew/bin/brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
        source "$(/opt/homebrew/bin/brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
    fi
fi

# -------------------------------------
# Kubectl

if [ -z "$CODESPACES" ]; then
    if [ ${HOME} != "/home/vscode" ]; then
        source <(kubectl completion zsh)
        complete -o default -F __start_kubectl k
    fi
fi

# -------------------------------------
# Vault

if [ -z "$CODESPACES" ]; then
    if [ ${HOME} != "/home/vscode" ]; then
        export VAULT_ADDR=https://vault.factory.adeo.cloud
        export VAULT_NAMESPACE=adeo/data-streaming-platform

        # If you come from bash you might have to change your $PATH.
        # export PATH=$HOME/bin:/usr/local/bin:$PATH

        export PATH="$HOME/.bin/:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/bin/:$PATH"
        
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/ruby/bin:$PATH"

        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3.10/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/python@3.11/bin:$PATH"
        
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.17/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/go@1.20/bin:$PATH"

        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/exa/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/bat/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/fd/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/btop/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/ncdu/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/duf/bin:$PATH"
        export PATH="$(/opt/homebrew/bin/brew --prefix)/opt/ssh-copy-id/bin:$PATH"
    fi
fi

source ~/.aliases
source ~/.functions
