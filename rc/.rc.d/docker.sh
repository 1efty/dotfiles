export LOCAL_REGISTRY_ROOT="${HOME}/.local-docker-registry"

# Spin up a local container registry
function local-registryup() {
	test -d $LOCAL_REGISTRY_ROOT || mkdir $LOCAL_REGISTRY_ROOT
	docker run -d --rm \
		-p 5000:5000 \
		-v $LOCAL_REGISTRY_ROOT:/var/lib/registry \
		--name registry \
		registry:2
}

# Spin down local container registry
function local-registrydown() {
	if [ "$(docker inspect -f '{{.State.Running}}' registry)" = "true" ]; then
		docker stop registry
	else
		echo "Local registry is already down."
	fi
}
