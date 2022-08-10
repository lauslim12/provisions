.PHONY: setup
setup:
	cd setup && ansible-playbook --diff --verbose ansible.yml -i hostfile --ask-become-pass

.PHONY: update-homebrew
update-homebrew:
	sh ./scripts/update-homebrew.sh

.PHONY: update-linux
update-linux:
	sh ./scripts/update-linux.sh

.PHONY: update-npm
update-npm:
	sh ./scripts/update-npm.sh
