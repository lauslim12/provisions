#!/bin/bash

##
# update-linux.sh
#
# Updates Debian-based Linux systems with APT. Updates, upgrades, removes dependencies, and cleans
# the APT package manager.
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
