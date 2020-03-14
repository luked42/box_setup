ps1_git_color() {
	local git_status="$(git status 2> /dev/null)"
}

ps1_git_branch() {
	git branch 2>/dev/null | grep '^*' | colrm 1 2
}

ps1_working_dir() {
	echo "${PWD#${PWD%/*/*}/}"
}

export PREFIX_DIR=${HOME}/.local
export PATH=${PREFIX_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PREFIX_DIR}/lib

if [[ -f /opt/rh/devtoolset-7/enable ]]; then
	source /opt/rh/devtoolset-7/enable
fi

if [[ -f ${HOME}/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh ]]; then
	source ${HOME}/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh
fi

# PS1 PROMPT
PS1_ORANGE="\033[48;5;234;38;5;208m"
PS1_YELLOW="\033[48;5;234;38;5;228m"
PS1_PASTEL_BLUE="\033[48;5;234;38;5;66m"
PS1_CLEAR="\033[0m"
PS1="
${PS1_PASTEL_BLUE}╔════┥ ${PS1_ORANGE}\u@\h${PS1_PASTEL_BLUE} ┝┥ ${PS1_YELLOW}\$(ps1_working_dir)${PS1_PASTEL_BLUE}
${PS1_PASTEL_BLUE}╚═╡ ${PS1_CLEAR}"


