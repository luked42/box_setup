# PS1 PROMPT
ORANGE="\[\033[48;5;234;38;5;208m\]"
YELLOW="\[\033[48;5;234;38;5;228m\]"
BLUE="\[\033[48;5;234;38;5;66m\]"
BRIGHT_RED="\033[48;5;234;38;5;160m"
BRIGHT_YELLOW="\033[48;5;234;38;5;226m"
BRIGHT_GREEN="\033[48;5;234;38;5;34m"
RESET="\[\033[0m\]"

ps1_git_color() {
	local git_status="$(git status 2> /dev/null)"

	if [[ ! $git_status =~ "working directory clean" ]]; then
		echo -e $BRIGHT_RED
	elif [[ $git_status =~ "Your branch is ahead of" ]]; then
		echo -e $BRIGHT_YELLOW
	elif [[ $git_status =~ "nothing to commit" ]]; then
		echo -e $BRIGHT_GREEN
	else
		echo -e $YELLOW
	fi
}

ps1_git_branch() {
	git branch 2>/dev/null | grep '^*' | colrm 1 2
}

ps1_working_dir() {
	echo -e "${PWD#${PWD%/*/*}/}"
}

ps1_host() {
	echo -e '\u@\h'
}

ps1_spacer() {
	#echo -e ' ┝┥ '
	#echo -e ' ◆ '
	echo -e ' 🞛 '
}

ps1_git() {
	local git_repo=$(git rev-parse --is-inside-work-tree 2> /dev/null)
	if [[ ${git_repo} == 'true' ]]; then
		echo -e "$(ps1_spacer)$(ps1_git_color)$(ps1_git_branch)"
	fi

	echo -e ${result}
}

build_ps1() {
	local result="\n"
	result+="${BLUE}╔════┥ ${ORANGE}$(ps1_host)${BLUE}$(ps1_spacer)${YELLOW}\$(ps1_working_dir)${BLUE}\$(ps1_git)"
	result+="\n${BLUE}╚═╡ ${RESET}"
	echo -e ${result}
}

export PREFIX_DIR=${HOME}/.local
export PATH=${PREFIX_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PREFIX_DIR}/lib

if [[ -f /opt/rh/devtoolset-8/enable ]]; then
	source /opt/rh/devtoolset-8/enable
fi

if [[ -f ${HOME}/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh ]]; then
	source ${HOME}/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh
fi

if [[ $(hostname) -eq 'opamux1090' ]]; then
  export http_proxy="http://opamwsp-static.comp.optiver.com:8080"
  export https_proxy="http://opamwsp-static.comp.optiver.com:8080"
fi

PS1=$(build_ps1)

export LS_COLORS='di=94';

## Aliases

# cmake
alias cma="cmake -GNinja -DCMAKE_BUILD_TYPE=Debug -DEXPORT_CMAKE_COMPILE_COMMANDS=true .."

shopt -s dotglob

for dot_file in ${HOME}/.config/extra_dots/*; do
  if [[ -f ${dot_file} ]]; then
    source ${dot_file}
  fi
done;

shopt -u dotglob
