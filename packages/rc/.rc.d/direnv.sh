# hook direnv into session
if command -v direnv >/dev/null; then
	eval "$(direnv hook $(basename $SHELL))"
fi
