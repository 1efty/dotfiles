if command -v aws-vault >/dev/null; then

	export AWS_VAULT_BACKEND="file"
	export AWS_VAULT_ASSUME_ROLE_TTL="1h"
	export AWS_VAULT_SESSION_TTL="12h"

	if [ -n "$AWS_VAULT" ]; then
		export ASSUME_ROLE=${AWS_VAULT}
		# Set the Terraform `aws_assume_role_arn` based on our current context
		export TF_VAR_aws_assume_role_arn=$(aws sts get-caller-identity --output text --query 'Arn' | sed 's/:sts:/:iam:/g' | sed 's,:assumed-role/,:role/,' | cut -d/ -f1-2)
		if [ -n "${TF_VAR_aws_assume_role_arn}" ]; then
			echo "* Assumed role $(green ${TF_VAR_aws_assume_role_arn})"
		else
			echo "* $(red Assume role failed)"
			exit 1
		fi
	else
		AWS_VAULT_ARGS=()
		AWS_VAULT_ARGS+=("--assume-role-ttl=${AWS_VAULT_ASSUME_ROLE_TTL}")
		AWS_VAULT_ARGS+=("--session-ttl=${AWS_VAULT_SESSION_TTL}")
	fi

	function _aws_vault_assume_role() {
		local role="${1}"
		if [ -z "${role+x}" ] || [ -z "${role}" ]; then
			echo "Usage: assume-role [role]"
			return 1
		fi
		shift
		if [ $# -eq 0 ]; then
			aws-vault exec ${AWS_VAULT_ARGS[@]} ${role} -- bash -l
		else
			aws-vault exec ${AWS_VAULT_ARGS[@]} ${role} -- $*
		fi
	}
fi
