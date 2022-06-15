#!/bin/bash

##
# update-linux.sh
#
# Updates Debian-based Linux systems with APT. Updates, upgrades, removes dependencies, and cleans
# the APT package manager.
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
