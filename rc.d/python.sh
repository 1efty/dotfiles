export PYENV_ROOT="${HOME}/.pyenv"

if [ "$PYENV_ENABLED" = "true" ]; then
	# Install pyenv
	if [ ! -d "$PYENV_ROOT" ]; then
		echo "Initializing pyenv..."
		git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT
	fi

	# Add pyenv bin to path
	if [ -d "$PYENV_ROOT" ]; then
		export PATH="${PYENV_ROOT}/bin:${PATH}"
	fi

	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi
