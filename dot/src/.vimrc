
set nocompatible " VIM 不使用和 VI 相容的模式

syntax on        " 語法上色顯示
filetype on      " Prevent lose syntax HL when split

" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950

" 編輯喜好設定
set tabstop=8    " tab 的字元數
set shiftwidth=4 " 設定縮排寬度 = 4
set softtabstop=4
set expandtab	   " 用 space 代替 tab

set nu	   " 設定行號
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Line\ %l,col\ %v,%p%%]

" Indentation type. Choose one
"set ai           " 自動縮排
set smartindent  " 設定 smartindent

set cinoptions=l1 " Indent for C/C++ case

" Include local vim settings
set exrc
set secure

" Good behavior of not exceeding col80
set colorcolumn=80
highlight ColorColumn ctermbg=52

""" Mappings
" Execute this file
nmap <F5> :!./%<CR>
" Switch to .h file
nmap <F7> :e %:r.h<CR>
" Switch to .cpp file
nmap <F8> :e %:r.cpp<CR>

