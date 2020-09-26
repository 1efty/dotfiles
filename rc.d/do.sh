if [ "${OS}" = "darwin" ]; then
	export DIGITALOCEAN_CONFIG="${HOME}/Library/Application Support/doctl/config.yaml"
fi

function doenv() {
	if [ -f "${DIGITALOCEAN_CONFIG}" ]; then
		export DIGITALOCEAN_ACCESS_TOKEN="$(yq r "/Users/1efty/Library/Application Support/doctl/config.yaml" access-token)"
	else
		echo "${DIGITALOCEAN_CONFIG} is not available"
	fi
}
