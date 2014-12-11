# This custom theme is modified from the ys terminal theme (See below).

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[208]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[208]%}›%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[154]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[197]%}⚡"

# Virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX="%{$FG[244]%}‹"
ZSH_THEME_VIRTUALENV_SUFFIX="›%{$reset_color%} "

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'

# Different caret and look for root.
if [ $UID -eq 0 ]; then
    local CARET="#"
    local USER_COLOR=$FG[197]$BG[052]
    local CARET_COLOR=$FG[197]
else
    local CARET="$"
    local USER_COLOR=$FG[154]
    local CARET_COLOR=$FG[154]
fi

local return_code="%(?..%{$FG[197]%}%? ↵%{$reset_color%})"
RPS1='${return_code}'

# user@host:pwd git_info virtualenvinfo time \n caret
PROMPT="
%B%{$USER_COLOR%}%n%{$reset_color%}\
%B%{$FG[015]%}@\
%{$FG[081]%}%m\
%{$FG[015]%}:\
%{$reset_color%}%{$FG[222]%}${current_dir}%{$reset_color%} \
${git_info}\
${virtualenv_info}\
%{$FG[015]%}[%B%*%b]
%{%B$CARET_COLOR%}$CARET %{$reset_color%}"
