export PYENV_ROOT="${HOME}/.pyenv"
# TODO: get pyenv to load plugins from different directory, like ZSH
# export PYENV_DIR="${HOME}/.pyenv-plugins"

if [ "$PYENV_ENABLED" = "true" ]; then
	# add pyenv bin to path
	if [ -d "$PYENV_ROOT" ]; then
		export PATH="${PYENV_ROOT}/bin:${PATH}"
	fi

	eval "$(pyenv init -)"
	# TODO: get pyenv to load plugins from different directory, like ZSH
	# eval "$(pyenv virtualenv-init -)"
fi
