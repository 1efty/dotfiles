export PKGS_INSTALL_PATH="${HOME}/.local/bin"
export PKGS_FILE="${HOME}/.pkgs"

function _uninstall_pkgs() {
	local pkgs=()

	if [ "$#" = 0 ]; then
		pkgs=$(cat $PKGS_FILE)
	else
		pkgs=$@
	fi

	for pkg in ${pkgs[@]}; do
		if [ -f "${PKGS_INSTALL_PATH}/$pkg" ]; then
			rm -rvf "${PKGS_INSTALL_PATH}/$pkg"
			sed -i --follow-symlinks "/^$pkg/d" $PKGS_FILE
		else
			echo "$pkg already uninstalled..."
		fi
	done
}

function _install_pkgs() {
	local temp="$(mktemp -d)"
	local cleanup=false
	local pkgs=()

	if [ "$#" = 0 ]; then
		pkgs=$(cat $PKGS_FILE)
	else
		pkgs=$@
	fi

	for pkg in ${pkgs[@]}; do
		if [ -f "${PKGS_INSTALL_PATH}/$pkg" ]; then
			echo "$pkg already installed..."
		else
			git clone https://github.com/1efty/pkgs.git "$temp"
			mkdir -p "$PKGS_INSTALL_PATH"
			make -C "${temp}/install" $pkg INSTALL_PATH="$PKGS_INSTALL_PATH"
			echo "$pkg" >>$PKGS_FILE
			cleanup=true
		fi
	done

	rm -rf "$temp" | head -n 1
}

function _update_pkgs() {
	_uninstall_pkgs $(cat $PKGS_FILE)
	_install_pkgs $(cat $PKGS_FILE)
}

function pkgs() {
	while [[ $1 ]]; do
		echo "Handling [$1]..."
		case "$1" in
		--install | -i | i | install)
			shift
			_install_pkgs $@
			break
			;;
		--uninstall | -u | u | uninstall)
			shift
			_uninstall_pkgs $@
			break
			;;
		--update | up | -up | update)
			_update_pkgs
			break
			;;
		*)
			echo "Error: Unknown option: $1" >&2
			exit 1
			;;
		esac
	done
}
