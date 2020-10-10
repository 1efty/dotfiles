export NPM_PACKAGES="${HOME}/.npm-packages"

# Setup a local npm package path
test -d "$NPM_PACKAGES" || mkdir "$NPM_PACKAGES"

# Add local npm package bin to $PATH
if [ -d $NPM_PACKAGES ]; then
	export PATH="${NPM_PACKAGES}/bin:${PATH}"
fi
