set nu
"set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set noshowmode

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
"Plug 'valloric/youcompleteme'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
call plug#end()

set background=light
set clipboard=unnamed
set laststatus=2
colorscheme PaperColor
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ }
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"
set timeoutlen=1000
set ttimeoutlen=1
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
let g:ale_completion_enabled = 0
