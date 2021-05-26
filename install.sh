#!/usr/bin/env bash -e

# get directory that script is located
# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
export DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# determine operating system, some templates need this
export OS="$(uname -s | tr '[[:upper:]]' '[[:lower:]]')"

# find available packages to stow
declare -a PACKAGES=$(find ./packages -maxdepth 1 -type d -exec basename {} \; | tail -n+2)

function template_file() {
	echo "Templating $1 to $2..."
	gomplate -f "$1" -o "$2"
}

function get_templates() {
	echo $(find ${DIR}/templates -type f)
}

function stow_pkg() {
	stow -v --ignore=.gitkeep --dotfiles --target $HOME -d packages "$1"
}

function unstow_pkg() {
	stow -v --ignore=.gitkeep --dotfiles --target $HOME -D -d packages "$1"
}

function render_templates() {
	local templates=$(get_templates)
	for tmpl in ${templates[@]}; do
		local pkg_path="$(basename $(dirname $tmpl))"
		template_file "$tmpl" "packages/${pkg_path}/$(basename $tmpl)"
	done
}

function stow_packages() {
	for pkg in ${PACKAGES[@]}; do
		stow_pkg $pkg
	done
}

function unstow_packages() {
	for pkg in ${PACKAGES[@]}; do
		unstow_pkg $pkg
	done
}

function usage() {
	cat <<EOF
Usage: bash install.sh [check|stow|unstow]
EOF
}

function check() {
	if [[ -z ${HOME+x} ]]; then
		echo "\$HOME is not set..."
		exit 1
	fi

	if [[ ! -d "${HOME}/.ssh" ]]; then
		echo "${HOME}/.ssh does not exist..."
		exit 1
	fi

	if [[ ! -L "${HOME}/.bashrc" ]] && [[ -e "${HOME}/.bashrc" ]]; then
		echo "${HOME}/.bashrc is a regular file and cannot be overwritten by Stow..."
		exit 1
	fi

	if [[ ! -L "${HOME}/.bash_profile" ]] && [[ -e "${HOME}/.bash_profile" ]]; then
		echo "${HOME}/.bash_profile is a regular file and cannot be overwritten by Stow..."
		exit 1
	fi

	if [[ ! -d "${HOME}/.local/share/fonts" ]]; then
		echo "${HOME}/.local/share/fonts does not exists..."
		exit 1
	fi
}

function parge_args() {
	# if no args passed, default to 'stow'
	if [ $# = 0 ]; then
		set -- "stow"
	fi

	while [[ $1 ]]; do
		echo "Handling [$1]"
		case "$1" in
		stow)
			check
			render_templates
			stow_packages
			exit
			;;
		unstow)
			check
			unstow_packages
			exit
			;;
		check)
			check
			exit
			;;
		*)
			usage
			exit
			;;
		esac
	done
}

function main() {
	parge_args $@
}

main $@
