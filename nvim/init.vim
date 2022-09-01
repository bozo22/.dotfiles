set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
call plug#begin()
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

source ~/.vimrc
