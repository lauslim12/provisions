#!/bin/bash

##
# functions.sh
#
# Special dotfile used to serve as all of my Shell's functions. This is used
# to perform sophisticated commands that are unable to be performed with `alias` alone.
# As per usual I try to make everything compatible with each other.
##

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

# Creates a Python Virtual Environment (Python 3) properly.
pythonvenv() {
  if ! [[ -d "./venv-${PWD##*/}" ]]; then
    python3 -m venv "./venv-${PWD##*/}"
  fi

  source ./venv-${PWD##*/}/bin/activate
}
