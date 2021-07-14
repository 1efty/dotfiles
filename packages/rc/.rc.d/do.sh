if command -v doctl >/dev/null; then

	if [ "${OS}" = "darwin" ]; then
		export DIGITALOCEAN_CONFIG="${HOME}/Library/Application Support/doctl/config.yaml"
	elif [ "${OS}" = "linux" ]; then
		export DIGITALOCEAN_CONFIG="${HOME}/.config/doctl/config.yaml"
	fi

	# setup environment for digitalocean communication
	# requires yq > 4.0 & doctl auth init
	function doenv() {
		if command -v yq >/dev/null; then
			if [ -f "${DIGITALOCEAN_CONFIG}" ]; then
				export DIGITALOCEAN_ACCESS_TOKEN="$(yq eval .access-token "${DIGITALOCEAN_CONFIG}")"
				export DO_TOKEN="${DIGITALOCEAN_ACCESS_TOKEN}"
			else
				echo "${DIGITALOCEAN_CONFIG} is not available"
			fi
		else
			echo "yq is not installed"
		fi
	}
fi
