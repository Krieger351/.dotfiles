" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =============================================
" Plugins
" =============================================
call plug#begin()
" tpope
Plug 'tpope/vim-sensible'

" Color Stuff
Plug 'morhetz/gruvbox'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" YCM 
Plug 'ycm-core/YouCompleteMe'

" autopairs
Plug 'jiangmiao/auto-pairs'

" ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" Language Files
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

" =============================================
" Settings
" =============================================

" Basics
set exrc
set secure
set hidden
let mapleader=" "
set nowrap 
set signcolumn=yes
set colorcolumn=80

" Movement
set scrolloff=8
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Undo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

if isdirectory(data_dir . '/undodir')
  mkdir(data_dir . '/undodir')
endif

" Numbers
set relativenumber
set nu

" Colors
set termguicolors 
colorscheme gruvbox
set term=xterm-256color

" Tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Serch
set nohlsearch
set ignorecase
set smartcase

" NERDTree Settings
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
  
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ctrl-p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

