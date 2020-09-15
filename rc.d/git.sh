# delete local tracking branches that are no longer on remote
function gitmergehook() {
	git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d 2>/dev/null
	git fetch -p
}

# get all commiters in repository
function gitcommitters() {
	git log --pretty="%an %ae%n%cn %ce" | sort | uniq
}

# remove a specific file from history
function gitremovefromhistory() {
	git filter-branch --force --index-filter "git rm --cached --ignore-match $1" --prune-empty --tag-name-filter cat -- --all
}

# set common git config in .git/config
function gitlocalconfig() {
	git config user.name "$(git config --get user.name)"
	git config user.email "$(git config --get user.email)"
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
