
alias which='type -a'
alias lx='ls -X --group-directories-first'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function bell () {
  echo -e '\e[0m\a'"$@"'\e[0m'
}

function alert () {
  bell '\e[0;31m'"$*"
}

function inform () {
  bell '\e[0;32m'"$*"
}

function progress () {
  echo -e '\e[0;34m'"$@"'\e[0m'
}

# Make a sound on a regex match
function rebell () {
  [ -z "$1" ] && cat -
  sed "s/$1/\x1b[0;31m&\x1b[0m\a/" -
}

# Repeat the last command
alias again='"$BASH" -c "$(history -p !!)"'

# Sudo the last command
alias please="sudo again"

# edit bashrc and aliases
alias refresh='. ~/.bashrc'

# move to parent directory and list files
alias up='cd ..; ls'

# rm safety
alias rm='rm -i'

# common ls options
alias ls='ls --group-directories-first --color=auto'

# grep recursively with context
alias tbgs='grep -H -C1 -n -d recurse'

# move to a directory and list files
cdls () {
    cd $1 && ls
}

# make a directory and move to it
mkcd () {
  if [ "$1" ]
  then
    mkdir $1 && cd $1
  fi
}

### Go to the parent directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# print full git history
alias glog="git log --date-order --graph --decorate --oneline"

# print recent git history
alias gl="glog -10"

# git management of dotfiles
alias gdf='git -C ~/dotfiles'

# format markdown as a man page for viewing in less
mdless () {
  if [ "$1" ]
  then
    pandoc -s -f markdown -t man "$1" | groff -T utf8 -man - | less "${@:2}"
  fi
}

# start periodic reminders
#   $1: number of reminders
#   $2: beeps per reminder (seconds)
periodic-alarm () {
    for i in $(seq $1)
    do
       sleep $2
       xkbbell
       for i in {2..5}
       do
           sleep 0.1s
           xkbbell
       done
    done
}
