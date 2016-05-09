" requires : python, lua, perl, ruby, gui, clang
" curses-dev, ncurses-devel.x86_64, perl-devel.x86_64, 
" perl-ExtUtils-Embed.noarch, perl-ExtUtils-ParseXS, perl-ExtUtils-XSpp,
" perl-ExtUtils-CBuilder, 
" libx11-dev libxpm-dev libxt-dev libX11-devel libXt-devl
" libgnome-devel.x86_64 libgnomeui-devel.x86_64 libgnome.x86_64 libgnomeui.x86_64
" libXpm.x86_64 libXpm-devel.x86_64
" libXt.x86_64 libXt-devel.x86_64 libXtst.x86_64 libXtst-devel.x86_64
" install vim
" ./configure --enable-pythoninterp=yes --enable-python3interp=yes \
" --enable-perlinterp=yes --enable-rubyinterp=yes --enable-luainterp=yes \ 
" --enable-gui=yes --with-features=huge --prefix=$HOME/opt/vim
" make && make install

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatic refreshing the file with :edit
set autoread

" source the .vimrc at local directory
set exrc

" restrict usage of some commands in non-default .vimrc file
set secure

" Quickly open/source .vimrc
nnoremap <leader>vv :e $MYVIMRC<CR>


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamedplus


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

set showcmd
" set dictionary+=/usr/share/dict/cracklib-small
set modeline
set background=dark
" autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set showmatch
"set cursorline
" autocmd BufWritePre *.py :%s/\s\+$//e

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" tmux navigator binding
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-a> :TmuxNavigatePrevious<cr>

" autosave on leave
let g:tmux_navigator_save_on_switch = 1

" easier moving between tabs
"" map <Leader>n <esc>:tabprevious<CR>
"" map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on
filetype plugin on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()


" ============================================================================
" Python IDE Setup
" ============================================================================

" run python code from Vim
" map <F6> :w <CR>!clear <CR>:!python2 % <CR>
nnoremap <silent> <F6> :!clear;python2 %<CR>

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
let g:ctrlp_open_new_file = 'r'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/bin/*
set wildignore+=*/coverage/*
set wildignore+=*.o,*.so,*.zip,*.tz
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg\svn)$'

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"" let g:pymode_doc = 1
"" let g:pymode_motion = 1

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" let g:jedi#completions_enabled = 1
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#force_py_version = 2
let g:jedi#use_tag_stack = 1
let g:jedi#auto_close_doc = 1
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Setting for syntastic
" cd ~/.vim/bunle
" git clone https://github.com/scrooloose/syntastic.git
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_mode_map = { "mode" : "active", "passive_filetypes" : ["cpp","c", "h"]}

" clang options
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11'
let g:clang_auto_select = 0
" let g:clang_auto = 0

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" set completeopt=longest,menuone
" function! OmniPopup(action)
"     if pumvisible()
"         if a:action == 'j'
"             return "\<C-N>"
"         elseif a:action == 'k'
"             return "\<C-P>"
"         endif
"     endif
"     return a:action
" endfunction
" 
" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Toogle Tag list
nnoremap <silent> <F8> :TlistToggle<CR>

" Toogle NERDTree
nnoremap <silent> <F9> :NERDTreeToggle<CR>

let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" config snipmate for AutoComplPop
" let g:acp_behaviorSnipmateLength = 1

" Use neocomplete
" let g:neocomplete#enable_at_startup = 1
" 
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" 
" if !exists('g:neocomplete#force_omni_input_patterns')
"         let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
