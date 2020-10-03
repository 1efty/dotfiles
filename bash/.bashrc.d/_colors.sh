function red() {
	echo "$(tput setaf 1)$*$(tput sgr0)"
}

function green() {
	echo "$(tput setaf 2)$*$(tput sgr0)"
}

function yellow() {
	echo "$(tput setaf 3)$*$(tput sgr0)"
}

function cyan() {
	echo "$(tput setaf 6)$*$(tput sgr0)"
}

if [ -z "${LS_COLORS+x}" ]; then
	if command -v dircolors >/dev/null 2>&1; then
		eval "$(dircolors -b)"
		export LS_OPTIONS="--color=auto"
		alias ls="ls $LS_OPTIONS"
	else
		echo "* Cannot properly set \$LS_COLORS"
	fi
fi
