set nu
"set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set noshowmode
autocmd VimEnter * silent !echo -ne "\e[1 q"

" Run PlugInstall if there are missing plugins
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \| PlugInstall --sync | source $MYVIMRC
" \| endif

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mangeshrex/everblush.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"Plug 'valloric/youcompleteme'
Plug 'https://github.com/w0ng/vim-hybrid'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
call plug#end()

set background=light
set clipboard=unnamed
set laststatus=2
colorscheme PaperColor
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
set timeoutlen=1000
set ttimeoutlen=1
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
let g:ale_completion_enabled = 0
