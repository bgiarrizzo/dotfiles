source ${HOME}/.functions

determine_if_codespaces_or_macos_or_linux

NEWLINE=$'\n'

# Codespaces zsh prompt theme
__zsh_prompt() {
    local prompt_username

    if [ "$CODESPACE" ]; then
        prompt_username="@${GITHUB_USER}"
        PROMPT="%{$fg[green]%}${prompt_username}%{$reset_color%} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )" # User/exit code arrow
    else
        prompt_username="%n"
        PROMPT="%{$fg[green]%}${prompt_username}%{$reset_color%} @ %{$fg[cyan]%}%m%{$reset_color%} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )" # User/exit code arrow
    fi

    PROMPT+='%{$fg_bold[blue]%}%(5~|%-1~/…/%3~|%4~)%{$reset_color%} ' # cwd
    PROMPT+='$([ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ] && git_prompt_info)' # Git status
    PROMPT+='%{$fg[white]%}${NEWLINE}$ %{$reset_color%}'

    unset -f __zsh_prompt
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%})"

__zsh_prompt
