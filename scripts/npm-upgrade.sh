#!/bin/bash
# Exit immediately if the script finds any errors.
set -e

# Print all executed commands on the screen.
set -x

# Main function to upgrade all NPM dependencies.
main() {
  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
  do
    npm install -g "$package"
  done
}

# Run main function.
main
