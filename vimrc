set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'aradunovic/perun.vim'
Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set laststatus=2
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4
retab
set fileformat=unix
set background=dark
set clipboard=unnamed
let g:seoul256_background=233
colo seoul256 
syntax enable
set t_Co=256
set number
set cursorline
set showmatch
set incsearch
set cindent
set backspace=2
set spell
imap jj <Esc>
hi Normal ctermbg=none
highlight NonText ctermbg=none
au BufRead,BufNewFile *.tpp set filetype=cpp
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tpp  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType h setlocal shiftwidth=2 tabstop=2 softtabstop=2

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
