# include cloudposse/build-harness
include $(shell curl --silent -o .build-harness "https://raw.githubusercontent.com/cloudposse/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

## Format shell scripts
fmt: packages/install/shfmt
	shfmt -d -w templates/bash/.* bash/.bashrc.d/* install.sh

## Install to $DOTFILES_PATH
install: packages/install/gomplate
	bash install.sh --install

## Remove $DOTFILES_PATH
uninstall:
	bash install.sh --uninstall

## Reinstall
reinstall: uninstall install
