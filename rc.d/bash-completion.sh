if [ "${OS}" = "darwin" ]; then
	[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
fi
