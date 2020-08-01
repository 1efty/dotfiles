# .bash_profile

if [ -f ${HOME}/.bashrc ]; then
	source ${HOME}/.bashrc
fi

# Load all files from login.d directory
if [ -d {{ env.Getenv "DOTFILES_PATH" }}/login.d ]; then
	for file in {{ env.Getenv "DOTFILES_PATH" }}/login.d/*.sh; do
		source $file
	done
fi
