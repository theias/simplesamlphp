SHELL := /bin/bash
UPSTREAM_URL := https://github.com/simplesamlphp/simplesamlphp.git
UPSTREAM_BRANCH := simplesamlphp-2.4
IAS_FILES := README.md Makefile .github/workflows/ias-build-release.yml
IAS_HEAD := $(shell git rev-parse HEAD)

.PHONY: all
all: sync-upstream

.PHONY: add-upstream
add-upstream:
	@if ! git remote get-url upstream > /dev/null 2>&1; then \
		git remote add upstream "$(UPSTREAM_URL)"; \
	fi

.PHONY: sync-upstream
sync-upstream: add-upstream
	git fetch --tags --force upstream
	git reset --hard upstream/$(UPSTREAM_BRANCH)
	git checkout $(IAS_HEAD) -- $(IAS_FILES)
	git diff --quiet --cached || git commit --message "IAS overlay"
	@latest=$$(git tag --list --merged refs/remotes/upstream/$(UPSTREAM_BRANCH) 'v[0-9]*' | sort --version-sort | tail --lines=1); \
		if [ -z "$$latest" ]; then echo "ERROR: no upstream v* release tag reachable from $(UPSTREAM_BRANCH)" >&2; exit 1; fi; \
		echo "Latest upstream release tag: $$latest"; \
		git tag --force "$$latest" HEAD; \
		git push --delete origin "$$latest" || true; \
		git push --force --tags origin master
