# Install direnv bash hook
if command -v direnv >/dev/null; then
	eval "$(direnv hook $(basename $SHELL))"
fi
