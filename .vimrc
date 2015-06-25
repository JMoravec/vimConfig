set nocompatible
"Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' "plugin budling for vim
Plugin 'rizzatti/dash.vim' "dash plugin for vim
Plugin 'altercation/vim-colors-solarized' "for actual good colors
Plugin 'sjl/gundo.vim' "graphfical undo, shows tree (\u)
Plugin 'rking/ag.vim' "for searching files (\a)
Plugin 'kien/ctrlp.vim' "for full path fuzzy file finder
Plugin 'scrooloose/syntastic' "for syntax checking
Plugin 'jiangmiao/auto-pairs' "for auto complete parenths
Plugin 'scrooloose/nerdcommenter' "to comment lines (\cc, \ci, etc.)
Plugin 'scrooloose/nerdtree' "for file browser
Plugin 'Xuyuanp/nerdtree-git-plugin' "to add git functionality to nerdtree
Plugin 'airblade/vim-gitgutter' "shows wich line changed since last commit
Plugin 'tpope/vim-fugitive' "Git wrapper (\g[esdm])
Plugin 'Valloric/YouCompleteMe' "Autocompletion functionality
Plugin 'wakatime/vim-wakatime' "time clocking
Plugin 'xolox/vim-misc' "requirement for vim-easytags
Plugin 'xolox/vim-easytags' "auto make tags so go to definition will work
Plugin 'PProvost/vim-ps1' "powershell scripting syntax
call vundle#end()

"map <leader> to ,
let mapleader=','

"syntax
filetype plugin indent on
syntax enable

"color/font
set background=dark
colorscheme solarized
set guifont=Inconsolata\ for\ Powerline:h16

"needed settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number

"powerline config
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols='fancy'
let g:powerline_pycmd='py'
let g:powerline_pyeval='pyeval'
set laststatus=2
set showtabline=2

"highlight cursor line
set cursorline

"visual autocomplete for command menu <TAB>
set wildmenu

"redraw screen only when needed
set lazyredraw

"highlight matching parenth
set showmatch

"search configs
"searches as chars are entered
set incsearch

"highlight matches to searches
set hlsearch

"turn off search highlight (\ space)
nnoremap <leader><space> :nohlsearch<CR>

"folding config
"enable folding
set foldenable

"opens most folds by default
set foldlevelstart=10

"10 fold max
set foldnestmax=10

"space opens and closes folds
nnoremap <space> za

"use indent for folds
set foldmethod=indent

"movement configs
"move by visual line
nnoremap j gj
nnoremap k gk

"togle gundo with \u
nnoremap <leader>u :GundoToggle<CR>

"open ag.vim
nnoremap <leader>a :Ag<CR>

"CtrlP options
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"for file specific commands
augroup configgroup
    autocmd!
    autocmd FileType java setlocal noexpandtab
augroup END


"Synastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_text_checkers = ['language_check']
let g:syntastic_text_language_check_args = '--language=en-US'
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_python_checkers = ['flake8', 'python']
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>e :Errors<CR>

"add Nerdtree automatically when vim starts
"autocmd vimenter * NERDTree
"augroup vimrc
    "autocmd!
"augroup END
"autocmd vimrc StdinReadPre * let s:std_in=1
"autocmd vimrc VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"fugitive.vim config (for git wrapper)
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gm :Gmove<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gbrowser<CR>

"remap ctrl-[hjkl] to move between splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"remap split commands
"window
nmap <leader>sw<left> :topleft vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up> :topleft new<CR>
nmap <leader>sw<down> :botright new<CR>

"buffer
nmap <leader>s<left> :leftabove vnew<CR>
nmap <leader>s<right> :rightbelow vnew<CR>
nmap <leader>s<up> :leftabove new<CR>
nmap <leader>s<down> :rightbelow new<CR>

"show syntax
nmap <leader>a :syntax on<CR>

"fix mac buffer close issue see https://github.com/carlhuda/janus/issues/71
nmap <leader>q :bp <BAR> bd #<CR>

"make moving between buffers easier
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
