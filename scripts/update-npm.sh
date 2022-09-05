#!/usr/bin/env bash

##
# update-npm.sh
#
# Script to upgrade all global NPM packages to their latest versions. This helps
# to keep the machine on the bleeding edge. Despite all of this, please remember that
# breaking changes may happen and you may have to reread the documentation in order
# to learn about the breaking changes and how to mitigate them.
##

# Exit immediately if the script finds any errors, and print all executed commands
# verbosely on the screen.
set -ex

# Main function to upgrade all NPM dependencies.
main() {
  for package in $(npm --location=global outdated --parseable --depth=0 | cut -d: -f2); do
    npm install --location=global "$package"
  done
}

# Run main function.
main
