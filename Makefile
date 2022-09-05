.PHONY: setup
setup:
	./setup/bootstrap.sh

.PHONY: update-homebrew
update-homebrew:
	sh ./scripts/update-homebrew.sh

.PHONY: update-linux
update-linux:
	sh ./scripts/update-linux.sh

.PHONY: update-npm
update-npm:
	sh ./scripts/update-npm.sh
