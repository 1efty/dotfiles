export HOMEBREW_NO_ANALYTICS=1

if [ -d "${HOME}/.linuxbrew" ]; then
    eval $(${HOME}/.linuxbrew/bin/brew shellenv)
elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
