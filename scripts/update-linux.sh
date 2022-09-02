#!/bin/bash

##
# update-linux.sh
#
# Updates Debian-based Linux systems with APT. Updates, upgrades, removes dependencies, and cleans
# the APT package manager.
##

# Main function.
main() {
	if [[ $OSTYPE == 'darwin'* ]]; then
		echo "MacOS does not support this script. Please only run this script on a Linux (Debian/Ubuntu) box."
		return 1
	fi

	sudo apt update
	sudo apt upgrade
	sudo apt autoremove
	sudo apt autoclean
	sudo apt clean
}

# Run main function.
main
