# enable vi command navigation
set -o vi

# operating system
export OS="$(uname -s | tr '[:upper:]' '[:lower:]')"

# disable BASH deprecation warnings on `darwin`
if [ "$OS" = "darwin" ]; then
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi
