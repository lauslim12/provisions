#!/bin/bash

##
# update-homebrew.sh
#
# Updates Homebrew. We also delete any unnecessary files and check the health
# of our system at the end of the process.
##

# Main function.
main() {
	sudo apt update
	sudo apt upgrade
	sudo apt autoremove
	sudo apt autoclean
	sudo apt clean
}

# Run main function.
main
