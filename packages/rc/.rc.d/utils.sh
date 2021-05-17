# clean up cache directories
function cclean() {
	# clean image cache
	if [ -d "${HOME}/.cache" ]; then
		find "${HOME}/.cache" \( -name "*.png" -o -name "*.jpg" \) -exec rm {} \;
	fi

	# clean terminal history
	history -c

	# clean terraform cache
	if [ -d "${HOME}/.terraform.d" ]; then
		rm -rf "${HOME}/.terraform.d"
	fi

	# clean packer cache
	if [ -d "${HOME}/.terraform.d" ]; then
		rm -rf "${HOME}/.packer.d"
	fi
}
