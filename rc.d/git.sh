# delete local tracking branches that are no longer on remote
function gitmergehook() {
	git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d 2>/dev/null
	git fetch -p
}

# get all commiters in repository
function gitcommitters() {
	git log --pretty="%an %ae%n%cn %ce" | sort | uniq
}

# setup auto-completion
if command -v git >/dev/null; then
	if [ "$OS" = "darwin" ]; then
		source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
		source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
	elif [ $OS = "linux" ]; then
		if [ -f "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
			# fedora
			source /usr/share/git-core/contrib/completion/git-prompt.sh
		elif [ -f "/usr/lib/git-core/git-sh-prompt" ]; then
			# ubuntu
			source /usr/lib/git-core/git-sh-prompt
		fi
	fi
fi
