#### terminal customization start
local USER_NAME='%B%F{red}%n%f%b'
local FOLDER_PATH='%B%F{84}%20~%f%b'
local NEWLINE=$'\n'
local DOLAR_SIGN='%F{228}$%f'
local SKULL_ICON=$'\U1F480'
local GIT_UNSTAGED_ICON=$'\U274C'
local GIT_UNTRACKED_FILES_ICON=$'\U1F69C'
local GIT_STAGED_ICON=$'\U2705'
local GIT_BRANCH_PRETEXT=$'on branch -> '

# Load version control information
autoload -Uz vcs_info

# run on pre command, get vcs_info and parse it into branch and status info
precmd() {
   vcs_info 
   psvar=(${(s:-string**separator**delimiter-:)vcs_info_msg_0_})
}

# listen for git traking changes
zstyle ':vcs_info:*' check-for-changes true
# set up tracking flag
zstyle ':vcs_info:*' unstagedstr '!no-staged!'
zstyle ':vcs_info:*' stagedstr 'ok-staged-ok'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# format current branch name with tracking flag
zstyle ':vcs_info:git:*' formats '%b-string**separator**delimiter-%u%c%m'

# set untracked file flag
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
      hook_com[misc]='?not-traked-files?'
  else
      hook_com[misc]=''
  fi
}

# display git text only if you are on git repository, integration hightlated in red
vcs_info_wrapper_branch_name() {
  if [[ "${vcs_info_msg_0_}" == "" ]]; then
    echo ""
  elif [[ ${psvar[1]} == "integration" ]]; then
    echo "%F{white}${GIT_BRANCH_PRETEXT}%K{9} %B%F{232}"%1v"%f%b %k"
  else
    echo "%F{white}${GIT_BRANCH_PRETEXT}%K{229} %B%F{232}"%1v"%f%b %k"
  fi
}

# display status icon
vcs_info_wrapper_status() {  
  if [[ ${psvar[2]} == "ok-staged-ok" ]]; then
    echo "${GIT_STAGED_ICON}"
  elif [[ ${psvar[2]} == *"!no-staged!"* || ${psvar[2]} == *"?not-traked-files?"* ]]; then
    echo "${GIT_UNSTAGED_ICON}"
  else
    echo ""
  fi
}

# display untracked icon
vcs_info_wrapper_status_untrcked_files() {
  if [[ ${psvar[2]} == *"?not-traked-files?"* ]]; then
    echo "${GIT_UNTRACKED_FILES_ICON}"
  else
    echo ""
  fi
}

# git related prompt text
vcs_info_wrapper() {
  echo $(vcs_info_wrapper_branch_name) $(vcs_info_wrapper_status)$(vcs_info_wrapper_status_untrcked_files)
}

setopt PROMPT_SUBST

PROMPT='${USER_NAME} ${SKULL_ICON} ${FOLDER_PATH} $(vcs_info_wrapper)${NEWLINE}${DOLAR_SIGN} '
#### terminal customization end
