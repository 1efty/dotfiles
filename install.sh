#!/usr/bin/env bash

export DOTFILES_PATH="$(pwd)"

declare -a PACKAGES=("bash" "git" "npm" "rc" "vim" "zsh")

function template_file() {
	gomplate -f "$1" -o "$2" 2>/dev/null
}

function get_templates() {
	echo $(find ${DOTFILES_PATH}/templates -type f)
}

function stow_pkg() {
	stow -v --ignore=.gitkeep --target $HOME "$1"
}

function unstow_pkg() {
	stow -v --ignore=.gitkeep --target $HOME -D "$1"
}

function install_pkgs() {
	templates=$(get_templates)
	for tmpl in ${templates[@]}; do
		local pkg_path="$(basename $(dirname $tmpl))"
		template_file "$tmpl" "${pkg_path}/$(basename $tmpl)"
	done

	# stow packages
	for pkg in ${PACKAGES[@]}; do
		stow_pkg $pkg
	done
}

function uninstall_pkgs() {
	for pkg in ${PACKAGES[@]}; do
		unstow_pkg $pkg
	done
}

function usage() {
	cat <<EOF
Usage: bash install.sh [--install] [--uninstall]
EOF
}

function parge_args() {
	while [[ $1 ]]; do
		echo "Handling [$1]"
		case "$1" in
		--install)
			install_pkgs
			exit
			;;
		--uninstall)
			uninstall_pkgs
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
