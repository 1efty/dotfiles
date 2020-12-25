export PKGS_INSTALL_PATH="${HOME}/.local/bin"
export PKGS_FILE="${HOME}/.pkgs"

function _get_pkgs_from_file() {
	local os=$(getos)
	cat $PKGS_FILE | awk -F ',' "/${os}/ {print \$2}"
}

function _uninstall_pkgs() {
	local pkgs=()
	local os=$(getos)

	if [ "$#" = 0 ]; then
		pkgs=($(_get_pkgs_from_file))
	else
		pkgs=($@)
	fi

	for pkg in ${pkgs[@]}; do
		if [ -f "${PKGS_INSTALL_PATH}/$pkg" ]; then
			rm -rvf "${PKGS_INSTALL_PATH}/$pkg"
			sed -i --follow-symlinks "/${os},${pkg}/d" $PKGS_FILE
		else
			echo "$pkg already uninstalled..."
		fi
	done
}

function _install_pkgs() {
	local temp="$(mktemp -d)"
	local pkgs=()
	local os=$(getos)

	if [ "$#" = 0 ]; then
		pkgs=($(_get_pkgs_from_file))
	else
		pkgs=($@)
	fi


	for pkg in ${pkgs[@]}; do
		if [ -f "${PKGS_INSTALL_PATH}/$pkg" ]; then
			echo "${pkg} already installed..."
		else
			mkdir -p "${PKGS_INSTALL_PATH}"
			git clone https://github.com/1efty/pkgs.git "$temp" || true
			make -C "${temp}/install" ${pkg} INSTALL_PATH="${PKGS_INSTALL_PATH}"
			# only update $PKGS_FILE if line doesn't exist
			grep -qxF "${os},${pkg}" ${PKGS_FILE} || echo "${os},${pkg}" >>$PKGS_FILE
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
