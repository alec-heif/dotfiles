set nocompatible

set t_Co=256

" Need this to be off for setting up vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'marijnh/tern_for_vim'
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()

" Back on
filetype plugin indent on

set backspace=indent,eol,start

" files open in working dir
set autochdir

" Don't redraw during macros
set lazyredraw
" Line where cursor is
set cursorline
" Bar on left
set ruler
set showcmd
set incsearch
set hlsearch
set linebreak
set scrolloff=3
set splitright
set splitbelow
set smartcase
set showmatch
set hidden
set smarttab
set history=1000
set undolevels=1000
set visualbell
set noerrorbells
set virtualedit=onemore
set nobackup
set noswapfile
set nowritebackup
" Don't blink
set matchtime=0

" Use vim 7.4 hybrid number mode
set relativenumber
set number

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

colorscheme solarized

let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" Comma-t toggles NerdTreeTabs
nmap <silent> tt :NERDTreeTabsToggle<CR>

" save full session on close
nnoremap <leader>e :mksession<CR>

" set delimitMate prefs
let delimitMate_expand_cr=1

" tmux/vim settings
nnoremap <silent> <C-m> :TmuxNavigatePrevious<CR>

nnoremap <M-h> :bp<CR>
nnoremap <M-l> :bn<CR>


" New split remaps
nnoremap <C-n> :new<CR>
nnoremap <C-i> :vnew<CR>

" shortcuts for the colon
nmap <space> :

" if hitting j on wrapped line, goes down visual line not logical line
nmap j gj
nmap k gk
inoremap jk <Esc>:w<CR>
inoremap df <Esc>/[)}"'\]>]<CR>:let @/ = ""<CR>a
inoremap jf <Esc>u
nnoremap <leader><space> :nohlsearch<CR>

" Change split navigation to ctrl+h, etc
" Open nerdtree startup wn a split  
let g:nerdtree_tabs_open_on_console_startup = 0

" When viewing directories, show nested tree mode
let g:netrw_liststyle=3

let g:netrw_dirhistmax = 0

" EasyMotion settings
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 1

map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map <space>l <Plug>(easymotion-lineforward)
map <space>h <Plug>(easymotion-linebackward)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
omap t <Plug>(easymotion-bd-tl)

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" " $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap gn :bn<CR>
nnoremap gb :bp<CR>
nnoremap gh :b<CR>
nnoremap gr :bp\|bw #<CR>

