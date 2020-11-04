# format all terraform files
function tfmt() {
	terraform fmt --recursive --diff .

	if command -v terragrunt >/dev/null; then
		terragrunt hclfmt
	fi
}
