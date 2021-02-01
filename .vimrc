set nu
set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set noshowmode

call plug#begin()
Plug 'gilgigilgil/anderson.vim'
Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
call plug#end()

let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"
set timeoutlen=1000
set ttimeoutlen=1
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'<':'>'}

