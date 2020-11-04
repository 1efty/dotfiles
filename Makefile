## format shell scripts
fmt:
	shfmt -d -w bash/.bashrc.d/* rc/.rc.d/*.sh install.sh

## initialize git submodules
init/submodules:
	git submodule update --init --recursive

## install packages to $HOME
install:
	bash install.sh --install

## uninstall all packages
uninstall:
	bash install.sh --uninstall

## reinstall all packages
reinstall: uninstall install
