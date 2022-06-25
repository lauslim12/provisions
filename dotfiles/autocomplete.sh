#!/bin/bash

##
# autocomplete.sh
#
# Special dotfile used to populate personal autocompletes. Usually, I may need this
# in order to be able to access a subdirectory briskly.
##

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

# this line registers our custom autocompletion function to be invoked 
# when completing arguments to the repo command
complete -F _projects_autocomplete -o nospace projects
