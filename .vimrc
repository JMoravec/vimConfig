set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mbbill/undotree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
call vundle#end()
filetype on
syntax enable
set background=dark
colorscheme solarized
set expandtab
set number
set showcmd
set cursorline
filetype indent plugin on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
nnoremap <leader><space> :nohlsearch<CR>
let g:syntastic_javascript_closurecompiler_path = "/home/joshua/programming/compiler.jar"
