#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# Aliases

alias ls='ls --color=auto'
alias logout='bspc quit'
alias pytest='pytest -q'
#alias clear='clear && pfetch'
alias mkdir='mkdir -vp'
alias c='clear'
alias hibernate='systemctl hibernate'
alias neofetch='neofetch --ascii ~/arch.txt'
alias nc='neocities'
alias pfetch="PF_INFO='title os wm sh memory' pfetch"

# Prompt

#export PS1="\[$(tput bold)\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;3m\]\W\[$(tput sgr0)\] \[$(tput bold)\]λ\[$(tput sgr0)\] \[$(tput sgr0)\]"

export PS1="\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;3m\]\W\[$(tput sgr0)\] \[$(tput bold)\]λ\[$(tput sgr0)\] \[$(tput sgr0)\]"

# Environment variables

LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'; export LS_COLORS
PROMPT_COMMAND='echo -ne "\033]0;urxvt\007"'
CC="clang"
CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
LDLIBS="-lcrypt -lcs50 -lm"

#pfetch
