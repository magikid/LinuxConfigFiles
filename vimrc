set nocompatible
 
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=ucs-bom,utf-8,latin1
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
 
set bs=indent,eol,start
set viminfo='20,\"500
set history=50
set ruler
if &t_Co > 2 || has("gui_runnint")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
endif
 
let &guicursor = &guicursor . ",a:blinkon0"
 
set showmatch
set matchtime=2
set matchpairs+=<:>
set scrolloff=2
set showmode
set title
set laststatus=2
set hidden
 
set directory=~/.vim/swap//
set backupdir=~/.vim/backups//
 
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
 
set splitbelow
set splitright
 
set nowrap
set sidescroll=1
set listchars=extends:>,precedes:<
set sidescrolloff=20
 
set hlsearch
set incsearch
 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
 
imap jj <Esc>
 
set autoread
set number
set virtualedit=block
 
syntax enable
filetype plugin indent on
 
augroup vimrcEx
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType md setlocal spell
  autocmd FileType gitcommit setlocal spell
augroup end
 
set background=dark
colorscheme solarized
command R !rspec %

let g:NERDTreeDirArrows=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
