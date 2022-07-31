set nu
"set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set noshowmode

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mangeshrex/everblush.vim'
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
