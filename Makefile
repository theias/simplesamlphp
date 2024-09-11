SHELL := /bin/bash
UPSTREAM := https://github.com/simplesamlphp/simplesamlphp.git

all: merge-upstream

.PHONY: add-upstream
add-upstream:
	@if ! [[ "$$(git remote get-url --all upstream)" == "$(UPSTREAM)" ]]; then \
		git remote add upstream "$(UPSTREAM)"; \
	fi

PHONY: merge-upstream
merge-upstream: add-upstream
	git fetch --tags upstream
	git push --tags
