set nu
syntax enable
set tabstop=4
set shiftwidth=4
set hidden
set nowrap
set cursorline
set encoding=utf-8 
set fileencoding=utf-8 
set ruler
set splitbelow
set splitright
set conceallevel=0
set smarttab
set smartindent
set autoindent
set mouse=a
set iskeyword+=-
set pumheight=10 
set expandtab
set noshowmode
set clipboard=unnamedplus
set laststatus=2
set updatetime=300
set timeoutlen=500
set ttimeoutlen=1
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
autocmd VimEnter * silent !echo -ne "\e[1 q"
autocmd VimEnter * redraw!
au! BufWritePost $MYVIMRC source %
cmap w!! w !sudo tee %
