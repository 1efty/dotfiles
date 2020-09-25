if [ "${OS}" = "darwin" ]; then
	DIGITALOCEAN_CONFIG="${HOME}/Library/Application Support/doctl/config.yaml"
fi

function doenv() {
	if [ -f "${DIGITALOCEAN_CONFIG}" ]; then
		export DIGITALOCEAN_ACCESS_TOKEN="$(yq r "${HOME}/Library/Application Support/doctl/config.yaml" access-token)"
	else
		echo "${DIGITALOCEAN_CONFIG} is not available"
	fi
}
