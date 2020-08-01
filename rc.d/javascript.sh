export NPM_PACKAGES="${HOME}/.npm-packages"

# Setup a local npm package path
if command -v npm >/dev/null; then
	test -f "${HOME}/.npmrc" || echo "prefix=\"${NPM_PACKAGES}\"" >"${HOME}/.npmrc"
	test -d "$NPM_PACKAGES" || mkdir "$NPM_PACKAGES"
fi

# Add local npm package bin to $PATH
if [ -d $NPM_PACKAGES ]; then
	export PATH="${NPM_PACKAGES}/bin:${PATH}"
fi
