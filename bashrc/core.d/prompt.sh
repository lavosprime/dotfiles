# Prompt string

## Color escape codes
PS_CLEAR='\[\e[0m\]'
PS_RED='\[\e[0;31m\]'
PS_ORANGE='\[\e[0;91m\]'
PS_GREEN='\[\e[0;32m\]'
PS_YELLOW='\[\e[0;33m\]'
PS_BLUE='\[\e[0;34m\]'
PS_PINK='\[\e[0;35m\]'
PS_VIOLET='\[\e[0;95m\]'
PS_TEAL='\[\e[0;36m\]'
case "${LAVOSPRIME_SOLARIZED}" in
  'light' ) PS_FAINT='\[\e[0;96m\]' ;;
  'dark'  ) PS_FAINT='\[\e[0;92m\]' ;;
  *       ) PS_FAINT='\[\e[0;90m\]' ;;
esac

## Helper functions

function _lavosprime_ps_name () {
  #TODO shorten/unify?
  whoami
}

function _lavosprime_ps_host () {
  if [ ! -z "${LAVOSPRIME_MACHINE}" ]; then
    echo "${LAVOSPRIME_MACHINE}"
  else
    hostname -s
  fi
}

## Pieces
#TODO bold?
PS_NAME=$PS_BLUE'$(_lavosprime_ps_name)'$PS_CLEAR
PS_HOST=$PS_TEAL'$(_lavosprime_ps_host)'$PS_CLEAR
#TODO repo->branch->path?
PS_DIR=$PS_GREEN'\w'$PS_CLEAR
#TODO port to desktop
# PS_SCM=$PS_YELLOW'$(_dotfiles_scm_info)'$PS_CLEAR
PS_SCM=''
#TODO can this tick?
PS_TIME=$PS_FAINT'\t'$PS_CLEAR

## All together now
export PS1=$PS_CLEAR'['$PS_NAME'@'$PS_HOST':'$PS_DIR$PS_SCM']\n'$PS_TIME' \$ '
