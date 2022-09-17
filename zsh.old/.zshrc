# history

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd nomatch menucomplete
zle_highlight=('paste:none')

# vim-style keybindings

bindkey -v
bindkey -s '^o' 'ranger^M'

# autocompletion
#
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# aliases

alias ls='ls --color=auto'
alias rm='rm -Ir'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias hss='hugo server --noHTTPCache'
alias cleanup='/home/$USER/.dotfiles/cleanup.sh'
alias gcc="gcc -Wall -Wextra -lm -o main"
alias diff="diff --strip-trailing-cr -Z"
alias g++="g++ -Wall -Wextra -o main"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# prompt

PROMPT='%B%F{blue}%1~%f λ %b'

# PATH

path+=('.')
    
# environment variables

RANGER_LOAD_DEFAULT_RC="FALSE"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# anaconda init function

anaconda () {
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
}

# ranger quit function

function ranger_func {
    ranger $*
    local quit_cd_wd_file="$HOME/.ranger_quit_cd_wd"
    if [ -s "$quit_cd_wd_file" ]; then
        cd "$(cat $quit_cd_wd_file)"
        true > "$quit_cd_wd_file"
    fi
}

source $HOME/.dotfiles/private.sh
