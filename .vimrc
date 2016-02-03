set nocompatible
filetype off

" Plugins (vim-plug)
call plug#begin()

Plug 'tpope/vim-sensible'  " Some sensible default settings
Plug 'bling/vim-airline'  " Better status line
Plug 'ctrlpvim/ctrlp.vim'  " Fuzzy searching for opening files quickly
Plug 'tpope/vim-surround'  " Surround text in braces, quotes etc
Plug 'scrooloose/syntastic'  " Syntax hints
Plug 'Lokaltog/vim-easymotion'  " Quickly move around files
Plug 'myusuf3/numbers.vim'  " Smart toggle between relativenumbers
Plug 'Valloric/YouCompleteMe'  " Autocompletion engine
Plug 'tpope/vim-fugitive'  " Git integration
Plug 'tpope/vim-commentary'  " Comment out with `gc`
Plug 'luochen1990/rainbow'  " Colour parentheses depending on block depth
Plug 'gcmt/wildfire.vim'  " Press enter to select closest text object
Plug 'osyo-manga/vim-over'  " Better find and replace (autocompletion and highlighting)
Plug 'airblade/vim-gitgutter'  " Git diff symbols in the gutter
Plug 'nathanaelkane/vim-indent-guides'  " Indent guide lines
Plug 'vim-scripts/sessionman.vim'  " Session saving and loading
Plug 'terryma/vim-multiple-cursors'  " Sublime Text style multiple cursors
Plug 'jiangmiao/auto-pairs'  " Automatically insert closing braces and quotes
Plug 'tpope/vim-repeat'  " Repeat support for plugin mappings

" Javascript
Plug 'elzr/vim-json'  " JSON support
Plug 'jelera/vim-javascript-syntax'  " JS syntax

" HTML
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
" Plug 'gorodinskiy/vim-coloresque'  " Disabled until author removed isk+=.
Plug 'mattn/emmet-vim'

call plug#end()

filetype plugin indent on

let g:plug_timeout = 6000

" Leader
let mapleader=','
let g:mapleader=','
map <space> ,
set notimeout
set ttimeout

" Syntax Highlighting / Theme
syntax enable
set background=dark
colorscheme Tomorrow-Night-Eighties
let g:airline_theme='tomorrow'
set guifont=Monaco\ for\ Powerline:h12
set linespace=-1

" Airline config
let g:airline_powerline_fonts = 1  " Enable patched fonts
set laststatus=2  " Always show status bar
" set noshowmode  " Disable default mode indicator
set timeoutlen=50  " Fix delay when leaving insert mode
" let g:airline#extensions#tabline#enabled = 1  " Enable tabline

" Syntastic config
let g:syntastic_check_on_wq = 0  " Don't run a check on :wq
let g:syntastic_javascript_checkers = ['jsxhint']

" CtrlP config
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|bower_components|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}  " Ignore vcs directories and _site

let g:ctrlp_working_path_mode = 'r'  " Use nearest .git directory as root

" EasyMotion config
map <Leader> <Plug>(easymotion-prefix)

" Vim-over fixes
cabbrev %s OverCommandLine<cr>%s
cabbrev s OverCommandLine<cr>s

" auto-pairs fixes
let AutoPairsCenterLine = 0  " Don't center screen on line when creating a pair

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
set ttymouse=xterm2
set mouse=a
set guioptions-=L  " Remove left scrollbar
set guioptions-=r  " Remove right scrollbar

" Tab completion on vim command line
set wildmenu  " Enable zsh style completion menu
set wildmode=full

" Other completion
set complete-=i
set completeopt-=preview

" -/= to navigate tabs
noremap - :bn<CR>
noremap = :bp<CR>

" Highlight characters past the 80 column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Make build shortcut
nnoremap <F5> :make<CR>
