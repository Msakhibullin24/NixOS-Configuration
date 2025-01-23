colorscheme catppuccin_mocha

filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

syntax on

set autochdir
set autoindent
set autoread
set clipboard="unnamedplus"
set nocompatible
set completeopt="menu,menuone,noselect"
set cursorline
set expandtab
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set mouse=""
set number
set relativenumber
set scrolloff=12
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set noswapfile
set tabstop=2
set termguicolors
set timeoutlen=500
set nowrap

let mapleader=" "
let maplocalleader=" "

nnoremap <leader>q :qa<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>w :w<cr>

nnoremap <leader>e :NERDTreeToggle<cr>

nnoremap <S-l> :bnext<cr>
nnoremap <S-h> :bprevious<cr>
nnoremap <leader>c :bdelete<cr>

inoremap jk <esc>
inoremap kj <esc>
