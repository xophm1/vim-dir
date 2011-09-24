" automatically indent lines (default)
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
"call pathogen#runtime_append_all_bundles()
call pathogen#infect('bundle')
let host_arch=substitute(system('uname -i'), "\n", "", "")
call pathogen#infect('bundle-'.host_arch)
call pathogen#helptags()

filetype on
filetype plugin on
filetype indent on

"set noautoindent

set showmatch    " show matching brackets
set showmode     " display mode INSERT/REPLACE/...
set showcmd      " display recognized command as you type it

set magic        " changes special characters in search patterns (default)
set esckeys      " Required to be able to use keypad keys and map missed escape sequences


set smartindent
"set paste              " Preserve indent when pasting
set pastetoggle=<F11>

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

" Use Vim defaults instead of Vi 
set nocompatible


" Line number toggle with F12
noremap <silent> <F12> :set number!<CR>
vnoremap <F3> y/<C-R>"<CR>
nmap <silent> <F3> n
nmap <silent> <S-F3> N
imap <silent> <F3> <C-O>n
imap <silent> <S-F3> <C-O>N

let mapleader=','

map <leader>s :source ~/.vimrc<cr> " Fast reloading of the .vimrc

" http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

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
"set foldmethod=indent
"highlight Folded ctermfg=red
"highlight FoldColumn ctermfg=white
"set fillchars=fold:⋯
"map zz zjzo
"set nofoldenable

" Encoding
set statusline+=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

" characters used when invisible chars are shown (with :set list)
"set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶,trail:·

"jquery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery 

" :W write file with sudo
command W w !sudo tee % > /dev/null

" tab as spaces
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set expandtab

" plugin: command-t
let g:CommandTMaxHeight=15

fun SetupVAM()
    " YES, you can customize this vam_install_path path and everything still works!
    let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
    exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

    " * unix based os users may want to use this code checking out VAM
    " to fetch VAM, VAM-known-repositories and the listed plugins
    " without having to install curl, unzip, git tool chain first
    if !isdirectory(vam_install_path.'/vim-addon-manager') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
        " I'm sorry having to add this reminder. Eventually it'll pay off.
        call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
        exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
    endif

    call vam#ActivateAddons(['snipmate-snippets'], {'auto_install' : 0})
    " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
    " where pluginA could be github:YourName or snipmate-snippets see vam#install#RewriteName()
    " also see section "5. Installing plugins" in VAM's documentation
    " which will tell you how to find the plugin names of a plugin
endf
call SetupVAM()
" experimental: run after gui has been started (gvim) [3]
" option1: au VimEnter * call SetupVAM()
" option2: au GUIEnter * call SetupVAM()
" See BUGS sections below [*]
"

