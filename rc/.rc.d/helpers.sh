# generate a random string
function randpw() {
	env LC_CTYPE=C tr -dc "a-zA-Z0-9-_" </dev/urandom | head -c "${1:-16}"
	echo
}

# create SOCKS5 tunnel using SSH
function ssht() {
	local host="$1"
	local port="${2:-"8080"}"
	local tunnels="$(pgrep -fa ${port})"
	if [ ! -n "$tunnels" ]; then
		ssh -D "$port" -f -C -q -N "$host"
		export SSH_TUNNEL_PID="$(pgrep -fal "ssh -D $port" | awk '{print $1}')"
	fi
	local proxy="socks5h://localhost:${port}"
	export ALL_PROXY="$proxy"
}

# destroy SOCKS5 tunnel
function sshtd() {
	kill $SSH_TUNNEL_PID 2>/dev/null
	unset ALL_PROXY SSH_TUNNEL_PID
}

# start a shell with an assumed role
function assume-role() {
	_aws_vault_assume_role $*
}
