set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

" Disable arrow keys until I get better at HJKL
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Syntax Highlighting
syntax enable

" Airline config
let g:airline_powerline_fonts = 1  " Enable patched fonts
set laststatus=2  " Always show status bar
set noshowmode  " Disable default mode indicator
set timeoutlen=50  " Fix delay when leaving insert mode

" Misc options
set backspace=indent,eol,start  " Fix backspace on newlines and tabs
set showcmd  " Show information about the current command
set display+=lastline  " Show the last line even if it doesn't fit on screen
set display+=uhex  " Show hex code for nonprintable characters
set history=1000  " Store 1000 commands in history
set lazyredraw  " Why not
set autoread  " Reload files if changed outside of vim
set scrolloff=2  " 2 lines of padding at the bottom of files
set foldmethod=indent  " Use indentation levels for code folding (lua/python)
set nrformats-=octal  " Prevent vim from incorrectly detecting number types
set nobackup  " Needed for writebackup
set writebackup  " Backup file while overwriting, delete backup when done
set undodir=~/.vim/undo  " Somewhere to store persistent undo
set undofile  " Persistent undo
vnoremap . :norm.<CR>  " Allow . repeat to run on visual selections
set t_Co=256  " Enable 256 colours

" Line numbers
set number  " Show line numbers
set ruler  " Show cursor position
set relativenumber  " Show relative line numbers in the gutter
highlight LineNr ctermbg=black

" Matching brackets
set showmatch  " Show matching brackets
set matchtime=2  " Only flash matching bracket for .2 of a second
syntax on  " Syntax hi

" Search
set incsearch  " Search as I type
set hlsearch  " Highlight search matches
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

" Unicode
set encoding=utf-8
setglobal fileencoding=utf-8
set nobomb
set fileencodings=ucs-bom,utf-8,iso-8859-1
" GUI and mouse
set ttymouse=xterm2
set mouse=a
set guifont=Monaco\ for\ Powerline\ 12

" Tab completion on vim command line
set wildmenu  " Enable zsh style completion menu
set wildmode=full

" Other completion
set complete-=i
set completeopt-=preview

" Leader
let mapleader = ","
let g:mapleader = ","

" -/= to navigate tabs
noremap - :tabprevious<CR>
noremap = :tabprevious<CR>

" Highlight characters past the 80 column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Function to toggle relative/absolute line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" Toggle line number type on ctrl+n
nnoremap <C-n> :call NumberToggle()<CR>

" Toggle line number depending on if vim has focus
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber

" Toggle line number if in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

