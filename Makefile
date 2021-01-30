DOCKER_COMPOSE = $(shell which docker-compose 2>/dev/null || echo "podman-compose")

.PHONY: fmt submodules stow unstow restow test verify

## format shell scripts
fmt:
	shfmt -d -w packages/bash/.bashrc.d/* packages/rc/.rc.d/*.sh install.sh

## git submodules
submodules:
	git submodule update --init --recursive --remote

## check if ready to install
check:
	bash install.sh check

## stow all packages
stow:
	bash install.sh stow

## unstow all packages
unstow:
	bash install.sh unstow

## restow all all packages
restow: unstow stow

## test project
test:
	$(DOCKER_COMPOSE) -f docker-compose.test.yml build
	$(DOCKER_COMPOSE) -f docker-compose.test.yml run sut

## verify installation
verify:
	bats tests
