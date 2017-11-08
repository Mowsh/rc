filetype plugin indent on

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'gcmt/wildfire.vim'

call plug#end()

" Leader
let mapleader=','
let g:mapleader=','
map <space> ,
set notimeout
set ttimeout

" Syntax Highlighting / Theme
syntax enable
colorscheme darcula

set laststatus=2  " Always show status bar
set timeoutlen=50  " Fix delay when leaving insert mode

" Misc options
set backspace=indent,eol,start  " Fix backspace on newlines and tabs
set showcmd  " Show information about the current command
set display+=uhex  " Show hex code for nonprintable characters
set history=10000  " Store 10000 commands in history
set lazyredraw  " Why not
set scrolloff=2  " 2 lines of padding at the bottom of files
set nrformats-=octal  " Prevent vim from incorrectly detecting number types
set nobackup  " Needed for writebackup
set writebackup  " Backup file while overwriting, delete backup when done
set undodir=~/.vim/undo  " Somewhere to store persistent undo
set undofile  " Persistent undo
vnoremap . :norm.<CR>  " Allow . repeat to run on visual selections
set t_Co=256  " Enable 256 colours
set nowrap  " Disable text wrapping

" Line numbers
set number  " Show line numbers
set ruler  " Show cursor position
set relativenumber  " Show relative line numbers in the gutter
highlight LineNr ctermbg=black

" Matching brackets
set showmatch  " Show matching brackets
set matchtime=2  " Only flash matching bracket for .2 of a second

" Search
set incsearch  " Search as I type
set ignorecase  " Ignore case of searches
set smartcase  " ...unless there's an uppercase letter in the query

" Whitespace
set autoindent  " Indent on newlines
set expandtab  " Use spaces for tabs
set shiftwidth=4  " Default to 4 space tabs
set tabstop=4
set softtabstop=4
set shiftround
set fileformats=unix,dos  " Prefer unix line endings
set listchars=tab:↹·,extends:⇉,precedes:⇇,trail:·
set list

" Unicode
set encoding=utf-8
setglobal fileencoding=utf-8
set nobomb
set fileencodings=ucs-bom,utf-8,iso-8859-1

" GUI and mouse
if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a
set guioptions-=L  " Remove left scrollbar
set guioptions-=r  " Remove right scrollbar
set guioptions-=m  " Remove the menubar
set guioptions-=T  " Remove the toolbar

" Tab completion on vim command line
set wildmenu  " Enable zsh style completion menu
set wildmode=full

" Other completion
set complete-=i
set completeopt-=preview

" Disable silly airline seperators
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''

" Easymotion config
let g:EasyMotion_do_mapping = 0
map <Space> <Plug>(easymotion-prefix)

" CtrlP Ignore
set wildignore+=*/target/*
set wildignore+=*/bin/*

" -/= to navigate tabs
noremap - :bn<CR>
noremap = :bp<CR>

" Highlight characters past the 80 column limit
highlight OverLength ctermbg=black ctermfg=white guibg=#592929
match OverLength /\%81v./

" Make build shortcut
nnoremap <F5> :make<CR>

" WritingMode command
fun! WritingMode( arg ) "{{{
    set wrap
    set linebreak
    highlight OverLength none
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$
endfunction "}}}

command! -nargs=* WritingMode call WritingMode( '<args>' )

