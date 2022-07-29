#!/bin/bash

##
# autocomplete.sh
#
# Special dotfile used to populate personal autocompletes. Usually, I may need this
# in order to be able to access a subdirectory briskly.
##

###############################################################################
# All in one, do all functions in order to activate autocomplete in Shell.    #
###############################################################################

# For Mac, set up 'compinit'.
if [ $(uname -s) = 'Darwin' ]; then
  autoload bashcompinit && bashcompinit
  autoload -Uz compinit && compinit
fi

# Autocomplete for the RAM of currently running processes.
_calcram() {
  local sum
  sum=0

  for i in `ps aux | grep -i "$1" | grep -v "grep" | awk '{print $6}'`; do
    sum=$(($i + $sum))
  done

  sum=$(echo "scale=2; $sum / 1024.0" | bc)
  echo $sum
}

# Set up autocompletes for my 'Projects' folder.
_projects_autocomplete() {
  local cmd=$1 cur=$2 pre=$3
  local arr i file

  # `COMPREPLY` has to be augmented with our directory list.
  COMPREPLY=()

  # Store the directories in an array before creating the autocomplete
  # list.
  arr=( $( cd "$PROJECTS_DIRECTORY" && compgen -f -- "$cur" ) )
  for ((i = 0; i < ${#arr[@]}; i++)); do
    file=${arr[i]}
    
    if [[ -d $PROJECTS_DIRECTORY/$file ]]; then
      file=$file/
    fi

    COMPREPLY[i]=$file
  done
}

# This line registers our custom autocompletion function to be invoked 
# when completing arguments to the 'projects' alias.
complete -F _projects_autocomplete -o nospace projects

# Activate `fzf` autocompletions depending on the current Shell.
[ ! -z "$BASH" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ ! -z "$ZSH_NAME" ] && [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
