# the name of this file is prefixed with a number to influence
# the order it is evaluated
# specifically the function _aws_vault_assume_role wouldn't exist unless aws-vault is in $PATH
# which is installed via brew
export HOMEBREW_NO_ANALYTICS=1

if [ -d "${HOME}/.linuxbrew" ]; then
	eval $(${HOME}/.linuxbrew/bin/brew shellenv)
elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
