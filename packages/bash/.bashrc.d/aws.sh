# setup bash completion
if command -v aws_completer >/dev/null; then
	if [ "$OS" = "linux" ]; then
		complete -C "$(which aws_completer)" aws
	fi
fi
