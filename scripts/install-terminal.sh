#!/bin/bash

##
# install-terminal.sh
#
# Installs my dotfiles for Terminal configurations to the current system. Dotfiles only, not the
# infrastructures, not VSCode settings, and not the Homebrew.
##

# Main function.
main() {
  # Verify that the user wants to install the dotfiles.
  echo "This script will install my dotfiles for Terminal, configure MacOS's defaults, and reload the shell."
  echo "Depending on your Shell, it will replace existing '.bash_aliases' or '.zshrc'."
  echo "Press Y if you want to continue, or press any key aside from Y to exit."
  read input
  if [ "$input" != "Y" ] && [ "$input" != "y" ]; then
    echo "Install process cancelled, no files are changed. Exiting..."
    return 1
  fi

  # Symbolic link to main Shell.
  if [ ! $(uname -s) = 'Darwin' ]; then
    cp ./dotfiles/main.sh ~/.bash_aliases
    . ~/.bashrc
  else
    cp ./dotfiles/main.sh ~/.zshrc
    . ~/.zshrc
  fi

  # If Mac, set sensible defaults from my dotfiles.
  if [ $(uname -s) = 'Darwin' ]; then
    sh ./scripts/setup-macos.sh
  fi

  # Print out message.
  echo "$(whoami), your Shell has been configured properly."
}

# Run main function.
main
