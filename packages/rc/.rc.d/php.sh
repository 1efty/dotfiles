# add local composer bin to path
export COMPOSER_HOME="${HOME}/.composer"

# add composer bin to $PATH
if [ -d "$COMPOSER_HOME" ]; then
	export PATH="${COMPOSER_HOME}/vendor/bin:${PATH}"
fi
