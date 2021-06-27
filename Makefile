setup:
	ansible-playbook --diff --verbose ansible.yml -i hostfile --ask-become-pass

update:
	brew doctor
	brew update
	brew upgrade

update-linux:
	sudo apt update
	sudo apt upgrade