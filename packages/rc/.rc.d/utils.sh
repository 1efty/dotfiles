# clean up cache directories
function cclean() {
	if [ -d "${HOME}/.cache" ]; then
		find "${HOME}/.cache" -name "*.png" -name "*.jpg" -exec rm {} \;
	fi
}
