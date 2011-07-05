" automatically indent lines (default)
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"set noautoindent

set showmatch    " show matching brackets
set showmode     " display mode INSERT/REPLACE/...
set showcmd      " display recognized command as you type it

set magic        " changes special characters in search patterns (default)
set esckeys      " Required to be able to use keypad keys and map missed escape sequences


set smartindent
set paste              " Preserve indent when pasting

set history=1000       " Command and search pattern history
set undolevels=1000    " use many levels of undo

" search is sensitive only if keyword contains an uppercase char 
set ignorecase
set smartcase
set incsearch     " incremental search
set hlsearch      " highligh all search pattern matches

" autocomplete file browsing
set wildmenu
set wildmode=list:longest,full

" ???
"set nocompatible


" Line number toggle with F12
noremap <silent> <F12> :set number!<CR>

" support des click souris
"set mouse=a

" Completion
setlocal omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i,k~/.vim/syntax/php.api

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" load tag files
set tags+=~/.vim/tags/palm

" highlight php syntax errors
au Syntax php runtime! syntax/php.vim
let php_sql_query=1                                         
let php_htmlInStrings=1
let php_parent_error_open = 1
let php_parent_error_close = 1
let php_no_shorttags = 1

syntax on          " enable syntax highlighting

" Run php file (CTRL-M) 
autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR> 
" Run php linter (CTRL-L) 
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR> 

" show cursor line and column in the status line
"set ruler

" Keep swap files in one location
set backupdir=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp

" Show the status line all the time
set laststatus=2

" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set encoding=utf-8

" Enable folding by indentation
" Use: zc, zo, zC, zO, zR, zM
set foldmethod=indent
highlight Folded ctermfg=red
highlight FoldColumn ctermfg=white
set fillchars=fold:⋯
map zz zjzo
set nofoldenable

" Encoding
set statusline+=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

" caractères invisibles
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶,trail:·

"jquery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery 

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>


filetype on
filetype plugin on
filetype indent on

" :W write file with sudo
command W w !sudo tee % > /dev/null

" tab as spaces
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set expandtab


