if [ "${OS}" = "darwin" ]; then
	export DIGITALOCEAN_CONFIG="${HOME}/Library/Application Support/doctl/config.yaml"
fi

# setup environment for digitalocean communication
function doenv() {
	if [ -f "${DIGITALOCEAN_CONFIG}" ]; then
		export DIGITALOCEAN_ACCESS_TOKEN="$(yq r "${HOME}/Library/Application Support/doctl/config.yaml" access-token)"
	else
		echo "${DIGITALOCEAN_CONFIG} is not available"
	fi
}
