# delete local tracking branches that are no longer on remote
function gitmergehook() {
	git branch --merged | egrep -v "(^\*|master|dev|main)" | xargs git branch -d 2>/dev/null
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
