# generate a random string
function randpw() {
	env LC_CTYPE=C tr -dc "a-zA-Z0-9-_" </dev/urandom | head -c "${1:-16}"
	echo
}

# create SOCKS5 tunnel using SSH
function ssht() {
	local host="${1}"
	local port="${2:-8080}"
	local tunnels="$(pgrep -fa ${port})"
	if [ ! -n "${tunnels}" ]; then
		ssh -D ${port} -f -C -q -N ${host}
	fi
	local proxy="socks5h://localhost:${port}"
	export ALL_PROXY="${proxy}"
}

# start a shell with an assumed role
function assume-role() {
	_aws_vault_assume_role $*
}
