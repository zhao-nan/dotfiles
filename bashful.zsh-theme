choose_prompt() {
    declare -a arr=("☕" "ξ" "无" "🤔" "🙄" "🤷" "🦕" "🙃" "🌌" "👀" "🦄" "🐘")
    echo ${arr[$(( $RANDOM % ${#arr[@]} + 1 ))]}
}

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[106]%}\uE0A0("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[106]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_SVN_PROMPT_PREFIX=" %{$FG[058]%}∠("
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$FG[058]%})%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_SVN_PROMPT_CLEAN=""

local smiley="%(?.%{$bg[green]$fg_bold[black]:)%}.%{$bg[red]$fg_bold[black]:(%})%{$reset_color%}"
NEWLINE=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'
RPROMPT="%{${_lineup}%}$FG[216]%*%{$reset_color%}%{${_linedown}%}"
PROMPT='${smiley} $FG[178]%n$FG[089]@$FG[075]%m$FG[044][%~] $(git_prompt_info)$(svn_prompt_info)${NEWLINE}$FG[201]$(choose_prompt)%{$reset_color%} '
