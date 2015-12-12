set number
"execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype on
"colorscheme koehler
set mouse=a
set showcmd
filetype plugin on
set dictionary+=/usr/share/dict/cracklib-small
set modeline
"set background=dark
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set history=100
set showmatch
set hlsearch
set incsearch
"set cursorline
autocmd BufWritePre *.py :%s/\s\+$//e


