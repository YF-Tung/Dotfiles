
set nocompatible
syntax on
filetype on

" File Encodings
set encoding=utf-8
set fileencodings=utf-8,cp950

" Tab and space
set tabstop=8       " Length of tab (ts)
set shiftwidth=4    " Length of indent (sw)
set softtabstop=4   " Length of soft tab
set expandtab       " Use space instead of tab (et)
" Show invisible tab
set showbreak=↪\
set list
"set listchars=tab:▸\ ,nbsp:⎵
"set listchars=eol:⏎,tab:␉·,trail:␠
"set listchars=eol:⏎,tab:▶·,trail:␠,nbsp:⎵
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=tab:→\ ,nbsp:⎵
"set listchars=tab:↹\ ,nbsp:⎵
set listchars=tab:»\ ,nbsp:⎵,trail:·

" Misc
colorscheme default
set nu              " Line number
set ruler           " Ruler
set backspace=2     " Compatible backspace
set ic              " Search ignore case
set hlsearch        " Highlight search
set incsearch       " Incrmental search
set confirm         " Confirm ambiguous commands
set history=100     " Vim command history
set cursorline      " Show current cursor line
set laststatus=2    " Always show status line
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Line\ %l,col\ %v,%p%%]

" Indentation type. Choose one
"set ai              " Auto indent
set smartindent     " Smart indent
set cinoptions=l1   " Indent for C/C++ case

" Include local vim settings
set exrc
set secure

" Good behavior of not exceeding col80
set colorcolumn=80
highlight ColorColumn ctermbg=52

" Mappings
" Execute this file
nmap <F5> :!./%<CR>
" Make
nmap <F6> :make<CR>
" Switch to .h file
nmap <F7> :e %:r.h<CR>
" Switch to .cpp file
nmap <F8> :e %:r.cpp<CR>

" Delete empty tab/spaces
nmap <F9> :%s/^\s\+$//g<CR>

autocmd BufEnter *.hql :setlocal filetype=sql
let g:ftplugin_sql_omni_key = '<C-j>'  " Fix laggy Ctrl+C for sql

