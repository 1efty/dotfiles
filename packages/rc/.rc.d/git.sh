# delete local tracking branches that are no longer on remote
function gitmergehook() {
	git branch --merged | egrep -v "(^\*|master|dev|main)" | xargs git branch -d 2>/dev/null
	git fetch -p
}

# get all commit authors in repository
function git_authors() {
	git log --pretty="%an %ae%n%cn %ce" | sort | uniq
}

# remove a specific file from history
function git_purge_file_from_history() {
	git filter-branch --force --index-filter "git rm --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
}

# remove a specific directory from history
function git_purge_dir_from_history() {
	git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
}

# set common git config in .git/config
function gitlocalconfig() {
	git config user.name "$(git config --get user.name)"
	git config user.email "$(git config --get user.email)"
}

function git_change_commit_author() {
	local WRONG_EMAIL="$1" NEW_NAME="$2" NEW_EMAIL="$3"
	git filter-branch --env-filter "
if [ \"\$GIT_COMMITTER_EMAIL\" = \"$WRONG_EMAIL\" ]
then
    export GIT_COMMITTER_NAME=\"$NEW_NAME\"
    export GIT_COMMITTER_EMAIL=\"$NEW_EMAIL\"
fi
if [ \"\$GIT_AUTHOR_EMAIL\" = \"$WRONG_EMAIL\" ]
then
    export GIT_AUTHOR_NAME=\"$NEW_NAME\"
    export GIT_AUTHOR_EMAIL=\"$NEW_EMAIL\"
fi
" --tag-name-filter cat -- --branches --tags
}
