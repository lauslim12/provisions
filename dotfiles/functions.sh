#!/bin/bash

##
# functions.sh
#
# Special dotfile used to serve as all of my Shell's functions. This is used
# to perform sophisticated commands that are unable to be performed with `alias` alone.
# As per usual I try to make everything compatible with each other.
##

# Initial setup of the dotfile, run essential functions before defining other, more generic functions.
# Normalize `open` across Linux, macOS, and Windows. This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
  if grep -q Microsoft /proc/version; then
    # Ubuntu on Windows using the Linux subsystem.
    alias open='explorer.exe'
  else
    # Normal open in Linux systems.
    alias open='xdg-open'
  fi
fi

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
    du $arg .[^.]* ./*
  fi;
}

# Provides information about branches and remotes the Git repository.
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

# Make directory and enter it.
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

# Cleans `node_modules` folder recursively from the current working directory. This function
# also prints out the folders being deleted.
nodeclean() {
  find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;
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

# Prints all of the environment variables in the current Shell.
path() {
  echo "${PATH//:/$'\n'}"
}

# Switches to `Projects` folder with autocomplete for the subdirectories for quick
# access to a project. If the folder does not exist, create the folder. The autocomplete
# is a bit bugged, the autocomplete only shows the folders that the current working directory has,
# so not in the `Projects` folder itself.
projects() {
  if [ ! -d ~/Projects ]; then
    mkdir -p ~/Projects
  fi

  if [ $1 ]; then
    cd ~/Projects/$1
  else
    cd ~/Projects
  fi
}

# Cleans 'py[cod]' and '__pychache__' directories/files in the current tree.
pythonclean() {
  find . | grep -E "(__pycache__|\.py[cod]$)" | xargs rm -rf
}

# Creates a Python Virtual Environment (Python 3) properly.
pythonvenv() {
  if ! [[ -d "./venv-${PWD##*/}" ]]; then
    python3 -m venv "./venv-${PWD##*/}"
  fi

  source ./venv-${PWD##*/}/bin/activate
}
