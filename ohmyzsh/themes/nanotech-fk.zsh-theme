# 321 ~/path/to/any/foo branch >>                         hh:mm:ss

PROMPT='%{$FG[238]%}%h %{$fg[cyan]%}%~ %{$fg[blue]%}$(git_prompt_info) %{$reset_color%}» '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

RPROMPT='   $FG[008]%D{%L:%M}%D{%p}%f'
