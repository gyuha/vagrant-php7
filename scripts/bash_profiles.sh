#!/usr/bin/env bash 

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export SVN_EDITOR="vim --noplugin"

set -o vi

export TERM='screen-256color'
export EDITOR=vim

alias tmux="tmux -2"
alias vi='vim'
alias of='/usr/bin/nautilus .' # 우분투에서 현재 폴더 탐색기로 열기
alias devgrep="grep --exclude-dir='.svn' --exclude='*.swp'"

alias tn='ts-node'

# A two-line colored Bash prompt (PS1) with Git branch and a line decoration
# which adjusts automatically to the width of the terminal.
# Recognizes and shows Git, SVN, HG and Fossil branch/revision.
# Michal Kottman, 2012
# REF : https://gist.github.com/mkottman/1936195
# REF2 : http://eduardolezcano.com/2-line-clean-prompt/

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
D_RED="\[\033[01;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

PS_LINE=`printf -- '..%.0s' {1..200}`
function parse_rep_branch {
	PS_BRANCH=''
	PS_VCS=''
	PS_FILL=${PS_LINE:0:$COLUMNS}
	if [ -d .git ]; then
		ref=$(git symbolic-ref HEAD 2> /dev/null) || return
		PS_VCS='git'
		PS_BRANCH="${ref#refs/heads/}"
	elif [ -d .svn ]; then
		PS_VCS='svn'
		PS_BRANCH="r$(svn info|awk '/Revision/{print $2}')"
	elif [ -d .hg ]; then
		PS_VCS='hg'
		PS_BRANCH="$(hg branch)"
	elif [ -f _FOSSIL_ -o -f .fslckout ]; then
		PS_VCS='fossil'
		PS_BRANCH="$(fossil status|awk '/tags/{print $2}')"
	fi
}

PROMPT_COMMAND=parse_rep_branch
PS_INFO="$GREEN\u$RESET@$YELLOW\h$RESET:$BLUE\w"
PS_REP="\[\033[\$((COLUMNS-\${#PS_VCS}-\${#PS_BRANCH}-1))G\] $RED\$PS_VCS $D_RED\$PS_BRANCH"
export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_REP}\n${RESET}\$ "


