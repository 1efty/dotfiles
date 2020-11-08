if command -v aws-vault >/dev/null; then

	export AWS_VAULT_BACKEND="file"
	export AWS_VAULT_DURATION="1h"

	if [ -n "$AWS_VAULT" ]; then
		export ASSUME_ROLE="$AWS_VAULT"
	else
		AWS_VAULT_ARGS=()
		AWS_VAULT_ARGS+=("--duration=${AWS_VAULT_ASSUME_ROLE_TTL}")
	fi

	function _aws_vault_assume_role() {
		local role="$1"
		if [ -z "${role+x}" ] || [ -z "$role" ]; then
			echo "Usage: assume-role [role]"
			return 1
		fi
		shift
		if [ $# -eq 0 ]; then
			aws-vault exec ${AWS_VAULT_ARGS[@]} "$role" -- $SHELL
		else
			aws-vault exec ${AWS_VAULT_ARGS[@]} "$role" -- $*
		fi
	}
fi
