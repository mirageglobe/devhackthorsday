.DEFAULT_GOAL:=help
.PHONY: all clean test SHELL

SHELL:=/bin/bash

##@ Tools

.PHONY: build test deploy build-init test-init test-lint deploy-init run
# phony is used to make sure theres no similar file such as <target> that cause the make recipie not to work

# core commands

build: build-init											## build project
	@echo ":: build project - ok ::"

test: test-init test-lint 						## test project
	@echo ":: test project - ok ::"

deploy: deploy-init										## deploy files
	@echo ":: deploy project - ok ::"

# helper commands

build-init:
	@echo ":: checking build dependancies ::"
	@command -v semver
	@command -v node
	@command -v shellcheck
	@command -v bats
	@echo ":: checking environment variables ::"
	@echo ":: building project ::"
	docker build --rm -t challengeone .

test-init:
	@echo ":: testing project ::"

test-lint:
	@echo ":: running lint ::"

deploy-init:
	@echo ":: deploy project ::"

# misc commands

run:																	## run project
	@echo ":: run project ::"
	docker run -p 8080:80 -d challengeone

##@ Helpers

.PHONY: version vpatch vminor vmajor help

version: 									## show current version
	@git describe --tags --abbrev=0

vinit: 										## initialise first version
	@git tag 0.1.0

vpatch: 									## show bumped version + patch (fix)
	@semver $$(git describe --tags --abbrev=0) -i patch

vminor: 									## show bumped version + minor (non breaking)
	@semver $$(git describe --tags --abbrev=0) -i minor

vmajor: 									## show bumped version + major (breaking)
	@semver $$(git describe --tags --abbrev=0) -i major

help:  										## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
