#!/bin/bash

##
# main.sh
#
# Dotfile to be used as the main source of everything in my dotfiles configuration. It ties up everything,
# bootstraps stuff, and loads them to shell once ready. You can say that this is the 'driver code' or
# the main function of a program if that makes it easier to understand.
#
# Compatible with: `bash`, `sh`, and `zsh` terminals. Tested OSes are MacOS, Debian, and Ubuntu.
# Other terminals (fish) should be supported, but is untested yet. Other OSes should be supported,
# as long as it is *nix based.
#
# The default path for the `provisions` repository is `~/Projects/provisions`. It is intentional and subjective, but
# I like having everything in an ordered fashion. Aliases, functions and the like will be sorted alphabetically for
# ease of reading.
#
# How to use:
# - This file should be renamed into `.bash_aliases`, `.zshrc`, or other shells from which this dotfile
# will be sourced automatically.
# - Of course you should move the renamed file to your home directory.
# - Restart your shell.
##

# Load aliases.
if [ -f ~/Projects/provisions/dotfiles/aliases.sh ]; then
  source ~/Projects/provisions/dotfiles/aliases.sh
fi

# Load functions.
if [ -f ~/Projects/provisions/dotfiles/functions.sh ]; then
  source ~/Projects/provisions/dotfiles/functions.sh
fi

# Load environment.
if [ -f ~/Projects/provisions/dotfiles/exports.sh ]; then
  source ~/Projects/provisions/dotfiles/exports.sh
fi
