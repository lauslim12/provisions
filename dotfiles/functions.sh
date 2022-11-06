#!/bin/bash

##
# functions.sh
#
# Special dotfile used to serve as all of my Shell's functions. This is used
# to perform sophisticated commands that are unable to be performed with `alias` alone.
# As per usual I try to make everything compatible with each other.
#
# The difference between 'aliases' and 'functions' is 'aliases' only contains a single command, while
# 'functions' can contain multiple commands and processes before achieving the intended result(s).
##

###############################################################################
# Preparations in our Shell to ensure all functions works properly.           #
###############################################################################

# Normalize `open` across Linux, macOS, and Windows. This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
  if grep -q -i Microsoft /proc/version; then
    # Ubuntu on Windows using the Linux subsystem.
    alias open='explorer.exe'
  else
    # Normal open in Linux systems.
    alias open='xdg-open'
  fi
fi

# Special function for Mac: quitting an application.
if [ $(uname -s) = 'Darwin' ]; then
  quit() {
    if [ -z "$1" ]; then
      echo "Usage: quit appname"
    else
      for appname in $1; do
        osascript -e 'quit app "'$appname'"'
      done
    fi
  }
fi

###############################################################################
# Shell functions.                                                            #
###############################################################################

# Change directory to selected directory with `fzf`.
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

# Search in command history and execute selected command with `fzf`.
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Determines the size of a file or a total size of a directory.
fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi

  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg *(D) ./*
  fi;
}

# Provides information about branches and remotes regarding the current Git repository.
gremotes() {
  is_in_git_repo || return

  echo '➤ git local branches'
  git branch
  echo ''
  echo '➤ git remote branches'
  git branch -r
  echo ''
  echo '➤ git remotes'
  git remote -v
  echo ''
}

# Checks whether the current repository is a Git repository or not.
is_in_git_repo() {
  git rev-parse HEAD >/dev/null 2>&1
}

# Loads environment file from a filename passed as an argument.
loadenv() {
  while read line; do
    if [ "${line:0:1}" = '#' ]; then
      continue
    fi

    export $line > /dev/null
  done < "$1"
}

# Make a directory and enters it.
mkcd() {
  if [ -z "$1" ]; then
    echo "Enter a directory name as the argument."
  elif [ -d "$1" ]; then
    echo -e "Folder '${RED}$*' already exists${NC}."
    cs "$1"
  else
    mkdir -p "$1" && cd "$1" || return
  fi
}

# `o` with no arguments opens the current directory, otherwise opens
# the given location.
o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# Switches to `Projects` folder with autocomplete for the subdirectories for quick
# access to a project. If the folder does not exist, create the folder. The autocomplete
# supports nested dictionaries.
projects() {
  if [ ! -d "$PROJECTS_DIRECTORY" ]; then
    mkdir -p $PROJECTS_DIRECTORY
  fi

  if [ $1 ]; then
    cd $PROJECTS_DIRECTORY/$1
  else
    cd $PROJECTS_DIRECTORY
  fi
}

# Creates a Python Virtual Environment (Python 3) properly. If it already exists,
# it will source the virtual environment.
pythonvenv() {
  if ! [[ -d "./venv-${PWD##*/}" ]]; then
    python3 -m venv "./venv-${PWD##*/}"
  fi

  source ./venv-${PWD##*/}/bin/activate
}

# Show how much RAM an application uses. First argument is used
# to get the process / application.
ram() {
  local sum
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
    return 0
  fi

  sum=$(_calcram $app)
  if [[ $sum != "0" ]]; then
    echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM!"
  else
    echo "No active processes matching pattern '${fg[blue]}${app}${reset_color}'."
  fi
}

# Same as `ram`, but tracks RAM usage in realtime. Will run until you stop it.
rams() {
  local sum
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
    return 0
  fi

  while true; do
    sum=$(_calcram $app)
    if [[ $sum != "0" ]]; then
      echo -en "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM\r"
    else
      echo -en "No active processes matching pattern '${fg[blue]}${app}${reset_color}'\r"
    fi
    sleep 1
  done
}