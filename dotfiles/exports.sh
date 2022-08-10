#!/bin/bash

##
# exports.sh
#
# Special dotfile used to place all of environment variables. This may be required when setting
# up several applications where we need to place an additional `PATH` variable. To add a new
# environment variable, you just need to do like the following: `echo "LANG=en_US.UTF-8" >> dotfiles/exports.sh`.
##

# Add your environment variables below.
export ZSH="$HOME/.oh-my-zsh"
