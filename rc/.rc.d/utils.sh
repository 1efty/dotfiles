# clear GNOME image thumbnail cache
function cclean() {
	find ${HOME}/.cache/thumbnails -name *.png -exec rm {} \;
}
