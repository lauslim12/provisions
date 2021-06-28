setup:
	ansible-playbook --diff --verbose ansible.yml -i hostfile --ask-become-pass

update:
	brew doctor
	brew update
	brew upgrade
	brew cleanup

update-linux:
	sudo apt update
	sudo apt upgrade
	sudo apt autoremove
	sudo apt autoclean
	sudo apt clean
