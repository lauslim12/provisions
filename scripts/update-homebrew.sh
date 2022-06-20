#!/bin/bash

##
# update-homebrew.sh
#
# Updates Homebrew. We also delete any unnecessary files and check the health
# of our system at the end of the process.
##

# Main function.
main() {
	brew update
	brew upgrade
	brew cleanup
	brew autoremove
	brew doctor
}

# Run main function.
main
