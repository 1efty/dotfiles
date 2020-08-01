if [ -d "${HOME}/.local/bin" ]; then
	export PATH="${HOME}/.local/bin:${PATH}"
fi

if [ -d "${HOME}/bin" ]; then
	export PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/go/bin" ]; then
	export PATH="${HOME}/go/bin:${PATH}"
fi

if [ "$OS" = "darwin" ]; then
	export PATH="/usr/local/sbin:${PATH}"
fi
