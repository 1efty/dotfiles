# .bash_profile

if [ -f "${HOME}/.bashrc" ]; then
	source "${HOME}/.bashrc"
fi

# Load all files from login.d directory
if [ -d "${HOME}/login.d" ]; then
	for file in "${HOME}/login.d/*.sh"; do
		source $file
	done
fi
