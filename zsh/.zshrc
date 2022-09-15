#
# Lines configured by zsh-newuser-install

# history

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vim-style keybindings

bindkey -v

# autocompletion

zstyle :compinstall filename '/home/bozo/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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
alias rg='ranger'

# prompt

PROMPT='%B%F{blue}%1~%f λ %b'

# PATH

path+=('.')
    
# environment variables

RANGER_LOAD_DEFAULT_RC="FALSE"

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
