.PHONY: setup
setup:
	./scripts/bootstrap.sh

.PHONY: setup-work
setup-work:
	WORK=TRUE CASK=TRUE ./scripts/bootstrap.sh

.PHONY: update
update:
	./scripts/update.sh
