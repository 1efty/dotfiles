export NPM_PACKAGES="${HOME}/.npm-packages"

# setup a local npm package path
test -d "$NPM_PACKAGES" || mkdir -p "$NPM_PACKAGES"

# add local npm package bin to $PATH
if [ -d "$NPM_PACKAGES" ]; then
	export PATH="${NPM_PACKAGES}/bin:${PATH}"
fi
