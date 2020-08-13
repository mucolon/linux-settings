# store colors
MAGENTA="\[\033[00;35m\]"
MAGENTA_BOLD="\[\033[01;35m\]"
YELLOW="\[\033[00;33m\]"
YELLOW_BOLD="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
BLUE_BOLD="\[\033[01;34m\]"
LIGHT_GRAY="\[\033[00;37m\]"
LIGHT_GRAY_BOLD="\[\033[01;37m\]"
CYAN="\[\033[00;36m\]"
CYAN_BOLD="\[\033[01;36m\]"
GREEN="\[\033[00;32m\]"
GREEN_BOLD="\[\033[01;32m\]"
RED="\[\033[00;31m\]"
RED_BOLD="\[\033[01;31m\]"
VIOLET="\[\033[00;35m\]"
VIOLET_BOLD="\[\033[01;35m\]"
DEFAULT="\[\033[00m\]"

function color_my_prompt {
  local __user_and_host="$GREEN_BOLD\u@\h"
  local __colon="$DEFAULT:"
  local __cur_location="$BLUE_BOLD\w"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$GREEN_BOLD"
  local __prompt_tail="$VIOLET_BOLD$"
  local __user_input_color="$DEFAULT"
  local __git_branch=$(__git_ps1);

  # colour branch name depending on state
  if [[ "${__git_branch}" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$RED_BOLD"
  elif [[ "${__git_branch}" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$YELLOW_BOLD"
  elif [[ "${__git_branch}" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$LIGHT_GRAY_BOLD"
  elif [[ "${__git_branch}" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$CYAN_BOLD"
  fi

  # Build the PS1 (Prompt String)
  PS1="$__user_and_host$__colon$__cur_location$__git_branch_color$__git_branch $__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt

# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi