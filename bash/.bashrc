#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# Aliases

alias ls='ls --color=auto'
alias pytest='pytest -q'
alias mkdir='mkdir -vp'
alias c='clear'
alias nc='neocities'
alias pfetch="PF_INFO='title os wm sh memory' pfetch"
alias gcc="gcc -Wall -Wextra -lm -o main"
alias r="ranger"
alias diff="diff --strip-trailing-cr -Z"
alias g++="g++ -Wall -Wextra -o main"
alias mester1="g++ -Wall -Wextra -o main mester.cpp && time cat be1.txt | ./main > ki && diff -s ki ki1.txt"
alias mester2="g++ -Wall -Wextra -o main mester.cpp && time cat be2.txt | ./main > ki && diff -s ki ki2.txt"

# Prompt

export PS1="\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;4m\]\W\[$(tput sgr0)\] \[$(tput bold)\]$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# Environment variables

LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'; export LS_COLORS
RANGER_LOAD_DEFAULT_RC="FALSE"
#PROMPT_COMMAND='echo -en "\033]0;urxvt\a"'
PATH=$PATH:.

# Scripts

# Manpage colors
man() {
	env LESS_TERMCAP_mb=$(printf '\e[01;31m') \
		LESS_TERMCAP_md=$(printf '\e[01;38;5;74m') \
		LESS_TERMCAP_me=$(printf '\e[0m') \
		LESS_TERMCAP_se=$(printf '\e[0m') \
		LESS_TERMCAP_so=$(printf '\e[38;5;246m') \
		LESS_TERMCAP_ue=$(printf '\e[0m') \
		LESS_TERMCAP_us=$(printf '\e[04;38;5;146m') \
    man "$@"
}

# Extract any archive
x () {
	if [ -f "$1" ] ; then
		case "$1" in
		*.rar) unrar x "$1" ;;
		*.tar) tar xvf "$1" ;;
		*.xz) xz -d "$1" ;;
		*.Z) uncompress "$1" ;;
		*) bsdtar -xf "$1" || echo "Unable to extract $1." ;;
		esac
	else
		echo "Usage: x [files]"
	fi
}

