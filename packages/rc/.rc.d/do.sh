if [ "${OS}" = "darwin" ]; then
	export DIGITALOCEAN_CONFIG="${HOME}/Library/Application Support/doctl/config.yaml"
elif [ "${OS}" = "linux" ]; then
	export DIGITALOCEAN_CONFIG="${HOME}/.config/doctl/config.yaml"
fi

# setup environment for digitalocean communication
function doenv() {
	if [ -f "${DIGITALOCEAN_CONFIG}" ]; then
		export DIGITALOCEAN_ACCESS_TOKEN="$(yq r "${DIGITALOCEAN_CONFIG}" access-token)"
		export DO_TOKEN="${DIGITALOCEAN_ACCESS_TOKEN}"
	else
		echo "${DIGITALOCEAN_CONFIG} is not available"
	fi
}
