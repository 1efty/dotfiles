# .bashrc

export DOTFILES_STORAGE_PATH="{{ env.Getenv "DOTFILES_STORAGE_PATH" }}"
export DOTFILES_INCLUDE_PATH="{{ env.Getenv "DOTFILES_INCLUDE_PATH" }}"

if [[ $- != *i* ]]; then
	# shell is non-interactive. be done now!
	return
fi

# Load all files from rc.d directory
if [ -d $DOTFILES_STORAGE_PATH/rc.d ]; then
	for file in $DOTFILES_STORAGE_PATH/rc.d/*.sh; do
		source $file
	done
fi

# Load all files from $DOTFILES_INCLUDE_PATH
if [ -d $DOTFILES_INCLUDE_PATH ]; then
	shfiles=$(
		shopt -s nullglob
		shopt -s dotglob
		echo $DOTFILES_INCLUDE_PATH/*.sh
	)
	if [ ${#shfiles} -gt 0 ]; then
		for file in ${shfiles[@]}; do
			source $file
		done
	fi
fi
