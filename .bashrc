is() {
	case "${1,,}" in
		macos) [ "$(uname)" = "Darwin" ]; return $?;;
		*) return 1;;
	esac
}

if is MacOS; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export HOMEBREW_NO_ENV_HINTS=1
	[ -f $(brew --prefix)/etc/bash_completion ] \
		&& . $(brew --prefix)/etc/bash_completion
fi

set -o vi

export PATH="$PATH:/Users/ben/.local/bin"
alias docker='podman'

export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com"
export MYREPOS="$GHREPOS/niftysweater"
export ZET="$MYREPOS/zet"
export CDPATH=".:$REPOS:$GHREPOS:$MYREPOS:$ZET"

prompt() {
	export PS1='[\u@\h \W]\$ '
	BRANCH="$(git branch --show-current 2>/dev/null)"
	[ -n "$BRANCH" ] && export PS1="[\u@\h \W]($BRANCH)\$ "
}

PROMPT_COMMAND="prompt"
