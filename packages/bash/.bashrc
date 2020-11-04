# .bashrc

if [[ $- != *i* ]]; then
	# shell is non-interactive. be done now!
	return
fi

# Load all files from .rc.d directory
if [ -d "${HOME}/.rc.d" ]; then
	for file in ${HOME}/.rc.d/*.sh; do
		source $file
	done
fi

# Load all files from .bashrc.d directory
if [ -d "${HOME}/.bashrc.d" ]; then
	for file in ${HOME}/.bashrc.d/*.sh; do
		source $file
	done
fi
