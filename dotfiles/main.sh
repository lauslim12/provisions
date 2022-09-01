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
# - This file should be copied from the directory, and sourced from `.zshrc` by doing: `cp main.sh $HOME/.myconfig.zsh` && `echo source $HOME/.myconfig.zsh >> .zshrc`.
# - Of course you can change the name from `.myconfig.zsh` to the other things that you'd probably like.
# - Restart your shell.
##

# Define global variables and essential constants for our Shell.
PROJECTS_DIRECTORY=$HOME/Projects
PROVISIONS_DIRECTORY=$HOME/Projects/provisions

# Load aliases.
if [ -f "$PROVISIONS_DIRECTORY/dotfiles/aliases.sh" ]; then
  source "$PROVISIONS_DIRECTORY/dotfiles/aliases.sh"
fi

# Load autocompletes.
if [ -f "$PROVISIONS_DIRECTORY/dotfiles/autocomplete.sh" ]; then
  source "$PROVISIONS_DIRECTORY/dotfiles/autocomplete.sh"
fi

# Load functions.
if [ -f "$PROVISIONS_DIRECTORY/dotfiles/functions.sh" ]; then
  source "$PROVISIONS_DIRECTORY/dotfiles/functions.sh"
fi

# Load environment.
if [ -f "$PROVISIONS_DIRECTORY/dotfiles/exports.sh" ]; then
  source "$PROVISIONS_DIRECTORY/dotfiles/exports.sh"
fi

# Prepare configurations for `oh-my-zsh`.
if [ -d $HOME/.oh-my-zsh ]; then
  # We load our specific `oh-my-zsh` configurations before doing anything.
  ZSH_CUSTOM="$PROVISIONS_DIRECTORY/dotfiles/oh-my-zsh"
  ZSH_THEME="random"
  ZSH_THEME_RANDOM_CANDIDATES=(
    "passion"
    "headline"
    "aphrodite"
    "pi"
    "short"
  )

  # Start `oh-my-zsh` with a custom theme.
  source $ZSH/oh-my-zsh.sh
fi
