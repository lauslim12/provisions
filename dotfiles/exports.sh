#!/bin/bash

##
# exports.sh
#
# Special dotfile used to place all default environment variables. This may be required when setting
# up several applications where we need to place an additional variables.
##

# Add your environment variables below.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/Users/$(whoami)/go/bin:$PATH
