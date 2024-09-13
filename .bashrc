set -o vi

export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com"
export NSREPOS="$GHREPOS/niftysweater"
export ZET="$NSREPOS/zet"
export LOCALBIN="$HOME/.local/bin"
export GOBIN="$HOME/go/bin"

export PATH="$GOBIN:$LOCALBIN:$PATH"
export CDPATH=".:$REPOS:$GHREPOSGH:$NSREPOS"

# Append to history so different terminals don't overwrite each other
shopt -s histappend
# Don't write commands that are consecutive duplicates or begin with space
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

prompt() {
	# Write to then read from history
	history -a && history -n

	export PS1="[\u@\h \W]\$ "

	# Add git branch to prompt if it exists
	BRANCH="$(git branch --show-current 2>/dev/null)"
	[ -n "$BRANCH" ] && export PS1="[\u@\h \W]($BRANCH)\$ "
}
PROMPT_COMMAND="prompt"

is() {
	case "${1,,}" in
		macos) [ "$(uname)" = "Darwin" ]; return $?;;
		*) return 1;;
	esac
}

if is MacOS; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export HOMEBREW_NO_ENV_HINTS=1
	[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
fi
