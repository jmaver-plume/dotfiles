" -----------------------
" Tab and Indentation Settings
" -----------------------

" Set the number of spaces a tab character represents.
" Reference: https://stackoverflow.com/questions/2054627/how-do-i-change-tab-size-in-vim
set tabstop=2

" Set the number of spaces used for each step of (auto)indent.
set shiftwidth=2

" Set the number of spaces a <Tab> in insert mode counts for.
set softtabstop=2

" Convert tabs to spaces.
set expandtab

" -----------------------
" Display and Syntax Settings
" -----------------------

" Enable syntax highlighting.
syntax on

" Automatically smart-indent based on file type.
set smartindent

" Enable auto-indentation.
set autoindent

" Display line numbers.
set number

" -----------------------
" Search and Clipboard Settings
" -----------------------

" Make search case-insensitive.
set ic

" Use the system clipboard for all yank, delete, change and put operations.
set clipboard=unnamed
