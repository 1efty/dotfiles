# .bashrc

if [[ $- != *i* ]]; then
	# shell is non-interactive. be done now!
	return
fi

# Load all files from rc.d directory
if [ -d ${HOME}/.bashrc.d ]; then
	for file in ${HOME}/.bashrc.d/*.sh; do
		source $file
	done
fi
