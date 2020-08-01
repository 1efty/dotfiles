export AWS_DATA_PATH="${HOME}/.aws"
export AWS_CONFIG_FILE="${AWS_DATA_PATH}/config"
export AWS_SHARED_CREDENTIALS_FILE="${AWS_DATA_PATH}/credentials"
export AWS_DEFAULT_REGION="us-east-1"
export AWS_DEFAULT_OUTPUT="json"

# Install auto-completion
if command -v aws_completer >/dev/null; then
	complete -C "$(which aws_completer)" aws
fi

# `Login` to aws
function awsenv() {
	local profile="${1}"

	if command -v aws >/dev/null; then
		if aws configure list --profile ${profile} >/dev/null; then
			export AWS_DEFAULT_PROFILE="${profile}"
			export AWS_VAULT="${profile}"
			export AWS_DEFAULT_REGION="$(
				aws configure get region --profile "${profile}"
			)"
			export AWS_ACCESS_KEY_ID="$(
				aws configure get aws_access_key_id --profile "${profile}"
			)"
			export AWS_SECRET_ACCESS_KEY="$(
				aws configure get aws_secret_access_key --profile "${profile}"
			)"
		else
			unset AWS_DEFAULT_PROFILE AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_VAULT
		fi
	fi
}
