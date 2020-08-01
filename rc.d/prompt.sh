# Enable terminal colors on macos
if [ "$OS" = "darwin" ]; then
	export CLICOLOR=1
fi

# Allow bash to check the window size to keep prompt with relative to window size
shopt -s checkwinsize

# Cache the current screen size
export SCREEN_SIZE="${LINES}x${COLUMNS}"

# Ensure `prompter` is in $PROMPT_COMMAND
export PROMPT_COMMAND
function _install_prompter() {
	if ! [[ "$PROMPT_COMMAND" =~ prompter ]]; then
		local final_colon=';$'

		if [[ -z "$PROMPT_COMMAND" ]]; then
			PROMPT_COMMAND="prompter;"
		elif [[ "$PROMPT_COMMAND" =~ "$final_colon" ]]; then
			PROMPT_COMMAND="${PROMPT_COMMAND}prompter;"
		else
			PROMPT_COMMAND="${PROMPT_COMMAND};prompter;"
		fi
	fi
}
_install_prompter
unset -f _install_prompter

# Prompt entry-point
function prompter() {
	for hook in ${PROMPT_HOOKS[@]}; do
		"${hook}"
	done
}

PROMPT_HOOKS+=("reload")
function reload() {
	local current_screen_size="${LINES}x${COLUMNS}"
	# Detect changes in screensize
	if [ "$current_screen_size" != "$SCREEN_SIZE" ]; then
		echo "* Screen resized to $current_screen_size"
		export SCREEN_SIZE="$current_screen_size"
		# Instruct shell that window size has changed to ensure lines wrap correctly
		kill -WINCH $$
	fi
}

# Define custom prompt
PROMPT_HOOKS+=("my_prompt")
function my_prompt() {
	local dir="\W"
	local git=$'\x01'$(tput setaf 3)$'\x02'$(__git_ps1)$'\x01'$(tput sgr0)$'\x02'
	if [ ! -z "$PYENV_VERSION" ]; then
		pyenv="(${PYENV_VERSION}) "
	fi
	if [ ! -z "$PYENV_VIRTUAL_ENV" ]; then
		pyenv="($(basename ${PYENV_VIRTUAL_ENV})) "
	fi
	if [ ! -z "$AWS_VAULT" ]; then
		aws=$'\x01'$(tput setaf 2)$'\x02'"(${AWS_VAULT}) "$'\x01'$(tput sgr0)$'\x02'
	fi
	if [ -n "$TOOLBOX_PATH" ]; then
		toolbox="🔹 "
	fi
	PS1="${toolbox}${pyenv}${aws}${dir}${git}\n$ "
}
