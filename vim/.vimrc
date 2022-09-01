set nu
"set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set noshowmode

" Run PlugInstall if there are missing plugins
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \| PlugInstall --sync | source $MYVIMRC
" \| endif

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mangeshrex/everblush.vim'
"Plug 'valloric/youcompleteme'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
call plug#end()

set background=light
set clipboard=unnamedplus
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
autocmd VimEnter * silent !echo -ne "\e[1 q"
autocmd VimEnter * redraw!
