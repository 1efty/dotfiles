.PHONY = fmt submodules stow unstow restow

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
