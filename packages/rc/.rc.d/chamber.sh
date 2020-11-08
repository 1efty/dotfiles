export CHAMBER_KMS_KEY_ALIAS="alias/chamber"

function chamber_init() {
	if command -v aws >/dev/null 2>&1; then
		key_aliases=("$(aws kms list-aliases --query "Aliases[*].AliasName" --output text)")
		if [[ ! "${key_aliases[@]}" =~ "${CHAMBER_KMS_KEY_ALIAS}" ]]; then
			echo "Creating KMS key for chamber..."
			key_id="$(aws kms create-key --description "Used by chamber" --output text --query KeyMetadata.KeyId)"
			aws kms create-alias --alias-name "$CHAMBER_KMS_KEY_ALIAS" --target-key-id "$key_id" >/dev/null
		else
			echo "Chamber key already exists..."
		fi
	else
		echo "AWS CLI is not installed. Cannot continue..."
	fi
}
