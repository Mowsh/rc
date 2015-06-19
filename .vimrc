set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'  " Better status line
Plugin 'tpope/vim-fugitive'  " Git stuff
Plugin 'kien/ctrlp.vim'  " Fuzzy searching for opening files
Plugin 'tpope/vim-surround'  " Surround text in quotes, brackets etc.
Plugin 'Valloric/YouCompleteMe'  " Code completion engine
Plugin 'marijnh/tern_for_vim'  " JavaScript completion
Plugin 'pangloss/vim-javascript'  " JavaScript Syntax Highlighting
Plugin 'scrooloose/syntastic'  " Syntax checking
Plugin 'tpope/vim-commentary'  " Comment stuff out
Plugin 'airblade/vim-gitgutter'  " Show git diff in the gutter
Plugin 'Yggdroot/indentLine'  " Show indent levels as lines
Plugin 'Lokaltog/vim-easymotion'  " Quickly move around files

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

" Leader
let mapleader=','
let g:mapleader=','
map <space> ,
set notimeout
set ttimeout

" Syntax Highlighting
syntax enable
set background=dark
colorscheme molokai

" Airline config
let g:airline_powerline_fonts = 1  " Enable patched fonts
let g:airline_theme = 'powerlineish'
set laststatus=2  " Always show status bar
" set noshowmode  " Disable default mode indicator
set timeoutlen=50  " Fix delay when leaving insert mode
" let g:airline#extensions#tabline#enabled = 1  " Enable tabline

" Syntastic config
let g:syntastic_check_on_wq = 0  " Don't run a check on :wq
let g:syntastic_javascript_checkers = ['jshint']

" CtrlP config
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|bower_components|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}  " Ignore vcs directories and _site

let g:ctrlp_working_path_mode = 'r'  " Use nearest .git directory as root

" EasyMotion config
map <Leader> <Plug>(easymotion-prefix)

" Misc options
set backspace=indent,eol,start  " Fix backspace on newlines and tabs
set showcmd  " Show information about the current command
set display+=lastline  " Show the last line even if it doesn't fit on screen
set display+=uhex  " Show hex code for nonprintable characters
set history=1000  " Store 1000 commands in history
set lazyredraw  " Why not
set autoread  " Reload files if changed outside of vim
set scrolloff=2  " 2 lines of padding at the bottom of files
" set foldmethod=indent  " Use indentation levels for code folding (lua/python)
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
syntax on  " Syntax highlighing

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
set guifont=Monaco\ for\ Powerline\ 12

" Tab completion on vim command line
set wildmenu  " Enable zsh style completion menu
set wildmode=full

" Other completion
set complete-=i
set completeopt-=preview

" -/= to navigate tabs
noremap - :tabprevious<CR>
noremap = :tabprevious<CR>

" Show a line on each indent
let g:indentLine_char = ''

" Highlight characters past the 80 column limit
let g:columnLine_char = ''
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Function to toggle relative/absolute line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" Toggle line number type on ctrl+n
nnoremap <C-n> :call NumberToggle()<CR>

" Toggle line number depending on if vim has focus
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber

" Toggle line number if in insert mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

