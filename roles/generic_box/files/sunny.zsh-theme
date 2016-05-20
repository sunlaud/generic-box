#based on gentoo theme


function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}


function sunny_git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}


PROMPT='%(!.%{$fg_bold[red]%}.%{$fg[green]%}%n@)%m:%{$fg_no_bold[cyan]%}%(!.%1~.%~)$(sunny_git_prompt_info)%{$fg[white]%}%_$(prompt_char)%{$reset_color%} '


ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"

