# format all terraform files
function tfmt() {
	terraform fmt . --recursive --diff
}
