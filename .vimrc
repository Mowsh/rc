set nocompatible

" Fix backspace
set backspace=indent,eol,start

set number  " Show line numbers
set history=1000  " 1000 commands history scrollback
set laststatus=2  " Always show status
set lazyredraw
set matchtime=2
set ruler  " Show the cursor position
set showcmd  " Show incomplete commands
set showmatch  " Show matches while typing
set relativenumber  " Show line numbers relative to cursor position
set display=lastline,uhex

" Search
set incsearch  " Incremental searching
set ignorecase  " Ignore case..
set smartcase  " ..unless there's a capital letter

" Whitespace
set autoindent  " Indent on <CR>
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround  " Only indent to multiples of 4
set smarttab
set fileformats=unix,dos  " Prefer unix linebreaks

" GUI
set ttymouse=xterm2
set mouse=a
set guifont=Menlo\ 11

" Unicode
set encoding=utf-8
setglobal fileencoding=utf-8
set nobomb
set fileencodings=ucs-bom,utf-8,iso-8859-1

" Tab completion
set wildmenu  " zsh style completion menu
set wildmode=full
set complete-=i
set completeopt-=preview

" Other
set autoread  " Reload changed files
set scrolloff=2  " 2 extra lines scroll padding
set foldmethod=indent  " code folding based on indents for lua and python
set foldlevel=99
set timeoutlen=1000
set ttimeoutlen=100 
set nrformats-=octal
set nobackup
set writebackup
set undodir=~/.vim/undo
set undofile

" Leader
let mapleader = ","
let g:mapleader = ","

" -/= to navigate tabs
noremap - :tabprevious<CR>
noremap = :tabnext<CR>

" Allow . repeat to run on visual selections
vnoremap . :norm.<CR>

" Enable code highlighting
syntax on

" Enable 256 colors
set t_Co=256

" Set colour scheme
colorscheme solarized

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Required by Vundle while installing packages
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundle 'Valloric/YouCompleteMe'
" Bundle 'scrooloose/syntastic'
Bundle 'flazz/vim-colorschemes'
Bundle 'northsky'
Bundle 'scrooloose/nerdtree'

" My bundles here:
"
" original repos on GitHub
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
