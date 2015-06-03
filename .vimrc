set nocompatible

filetype off

set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'kien/ctrlp.vim'

call vundle#end()

filetype plugin indent on

set backspace=indent,eol,start

set ruler
set number
set showcmd
set incsearch
set hlsearch
set linebreak
set scrolloff=3
set splitright
set timeoutlen=100
set fillchars=fold:\ ,
set smartcase
set showmatch
set hidden
set smarttab
set history=1000
set undolevels=1000
set visualbell
set noerrorbells

set mouse=a

set wildmenu
set wildmode=list:longest,full


" remap leader to comma
let mapleader=","

if exists('&breakindent')
  set breakindent
endif

" Airline says what mode we're in
set noshowmode

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set ttyfast

augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!
  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

syntax on

set background=dark

"let g:solarized_termcolors=256

colorscheme solarized

let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" Comma-t toggles NerdTreeTabs
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" Comma-c copies page to file
nmap <silent> <leader>c :%w !pbcopy<CR>

" shortcuts for the colon
nmap <space> :
nmap ; :

" if hitting j on wrapped line, goes down visual line not logical line
nmap j gj
nmap k gk
:inoremap jk <Esc>

" Change split navigation to ctrl+h, etc
nnoremap <C-J> <C-W>j "Ctrl-j to move down a split  
nnoremap <C-K> <C-W>k "Ctrl-k to move up a split  
nnoremap <C-L> <C-W>l "Ctrl-l to move    right a split  
nnoremap <C-H> <C-W>h "Ctrl-h to move left a split  

" Open nerdtree on startup?
let g:nerdtree_tabs_open_on_console_startup = 0

" When viewing directories, show nested tree mode
let g:netrw_liststyle=3

let g:netrw_dirhistmax = 0

