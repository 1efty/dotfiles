## Format shell scripts
fmt:
	shfmt -d -w bash/.bashrc.d/* rc/.rc.d/*.sh install.sh

## Initialize git submodules
init/submodules:
	git submodule update --init --recursive

## Install packages to $HOME
install:
	bash install.sh --install

## Uninstall all packages
uninstall:
	bash install.sh --uninstall

## Reinstall all packages
reinstall: uninstall install
