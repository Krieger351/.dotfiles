syntax enable
 
set cursorline

filetype indent on
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

set wildmenu
set showmatch
 
set ttymouse=xterm2
set mouse=a
set incsearch
set hlsearch
set ignorecase
set smartcase
 
set history=1000
set undolevels=1000
set undodir=~/.vim/undodir
set undofile
set nobackup

set smartindent
set nowrap
set noswapfile
set colorcolumn=80

if v:version < 800
  set belloff=all
endif
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let mapleader = " "

highlight ColorColumn ctermbg=0 guibg=lightgrey
au FileType gitcommit set tw=72

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'

call plug#end()

colorscheme gruvbox
set background=dark
set encoding=utf8

" NERDTree Settings
let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
