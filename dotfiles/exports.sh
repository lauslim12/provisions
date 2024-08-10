#!/bin/bash

##
# exports.sh
#
# Special dotfile used to place all default environment variables. This may be required when setting
# up several applications where we need to place additional variables.
##

###############################################################################
# Predefined environment variables for the usage of specific applications.    #
###############################################################################

# Go
export PATH=/Users/$(whoami)/go/bin:$PATH

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Fnm
eval "$(fnm env --use-on-cd)"

# Fzf
eval "$(fzf --zsh)"

###############################################################################
# Add custom environment variables below here.                                #
###############################################################################
