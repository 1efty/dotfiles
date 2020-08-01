# include cloudposse/build-harness
include $(shell curl --silent -o .build-harness "https://raw.githubusercontent.com/cloudposse/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

export DOTFILES_STORAGE_PATH ?= $(HOME)/.dotfiles
export DOTFILES_INCLUDE_PATH ?= $(HOME)/.dotfiles.d

## Format shell scripts
fmt: packages/install/shfmt
	shfmt -d -w templates/* bashrc.d/*.sh

## Install to $DOTFILES_PATH
install: packages/install/gomplate
	bash install.sh

## Remove $DOTFILES_PATH
uninstall:
	rm -rf $(DOTFILES_STORAGE_PATH)

## Reinstall
reinstall: uninstall install
