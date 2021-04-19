# generate a random string
function randpw() {
	env LC_CTYPE=C tr -dc "a-zA-Z0-9-_" </dev/urandom | head -c "${1:-16}"
	echo
}

# get operating system
function getos() {
	uname -s | tr '[[:upper:]]' '[[:lower:]]'
}

# create SOCKS5 tunnel using SSH
export SSHT_PORT="${SSHT_PORT:-"10088"}"
export SSHT_HOST="${SSHT_HOST:-"socks5"}"

function ssht() {
	local host="${1:-"${SSHT_HOST}"}"
	local port="${2:-"${SSHT_PORT}"}"

	if [ -n "$SSH_TUNNEL_PID" ]; then
		sshtd
	fi

	ssh -D "$port" -f -C -q -N "$host"
	export SSH_TUNNEL_PID="$(pgrep -fal "ssh -D $port" | awk '{print $1}')"

	export ALL_PROXY="socks5h://localhost:${port}"
}

# destroy SOCKS5 tunnel
function sshtd() {
	if ps -p $SSH_TUNNEL_PID >/dev/null; then
		kill $SSH_TUNNEL_PID 2>/dev/null
	fi
	unset ALL_PROXY SSH_TUNNEL_PID
}

# start a shell with an assumed role
function assume-role() {
	_aws_vault_assume_role $*
}
