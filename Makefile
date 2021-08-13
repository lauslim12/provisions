.PHONY: setup
setup:
	ansible-playbook --diff --verbose ansible.yml -i hostfile --ask-become-pass

.PHONY: update-homebrew
update-homebrew:
	brew doctor
	brew update
	brew upgrade
	brew cleanup
	brew autoremove

.PHONY: update-linux
update-linux:
	sudo apt update
	sudo apt upgrade
	sudo apt autoremove
	sudo apt autoclean
	sudo apt clean

.PHONY: update-npm
update-npm:
	npm update -g
