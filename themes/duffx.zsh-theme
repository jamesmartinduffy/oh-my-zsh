local current_dir="%{$fg_bold[cyan]%}%~"
local time="%{$fg_bold[white]%}[%*]"

PROMPT='
# ${current_dir}
%{$fg_bold[white]%}$ '
RPROMPT='$(git_prompt_info) ${time}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$fg_bold[green]%}"

# override git prompt to put symbol before repo name
function git_prompt_info() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty) ${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
