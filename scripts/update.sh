#!/usr/bin/env bash

##
# update.sh
#
# Updates all software packages on the current machine. Packages which will be updated are:
#
# - Homebrew: updates, upgrades, deletes any unnecessary files, and check the health of our system at the end of the process.
# - Linux: updates, upgrades, removes dependencies, and cleans the `apt` package manager.
# - Node Package Manager: updates all global `npm` packages to the latest versions.
#
# This script helps to keep the machine on the bleeding edge. Despite all of this, please remember that
# breaking changes may happen and you may have to reread the documentation of Homebrew, `apt`, and `npm` in order
# to learn about the breaking changes and how to mitigate them.
##

# aptUpdate updates all `apt` packages.
aptUpdate() {
	sudo apt update
	sudo apt upgrade
	sudo apt autoremove
	sudo apt autoclean
	sudo apt clean
}

# homebrewUpdate updates all `brew` command line tools.
homebrewUpdate() {
  brew update
	brew upgrade
	brew cleanup
	brew autoremove
	brew doctor
}

# npmUpdate updates all `npm` packages to the latest versions.
npmUpdate() {
  for package in $(npm --location=global outdated --parseable --depth=0 | cut -d: -f2); do
    npm install --location=global "$package"
  done
}

# message prints a message to the user.
message() {
  if [[ $# -eq 0 ]]; then
    echo "The function requires an argument, which is a string. This is a programmer's error, please tell the engineer to fix it as soon as possible."
    exit 1
  fi

  echo "[→ → →] $1"
}

# Main function.
main() {
  # Updates Homebrew.
  if [[ $(command -v brew) == "" ]]; then
    message "Homebrew is not installed, thus Homebrew will not be updated."
  else
    message "Homebrew is installed, updating that right now."
    homebrewUpdate
  fi

  # If applicable, we now update the `apt` package manager.
  if [[ $OSTYPE == 'darwin'* ]] || [[ $(command -v apt) == "" ]]; then
    message "OS is MacOS, or the 'apt' package manager does not exist and thus will not be updated."
  else
    message "The 'apt' package manager exists and is updating that right now."
    aptUpdate
  fi

  # Updates all global `npm` packages to the latest versions.
  if [[ $(command -v npm) == "" ]]; then
    message "Node Package Manager (npm) is not installed. Will not be updated and this step is skipped."
  else
    message "Currently updating global 'npm' packages."
    npmUpdate
  fi

  # Print success message.
  message "Provisions's 'update' script has finished running successfully."
}

# Run main function.
main
