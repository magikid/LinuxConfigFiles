set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set incsearch
set laststatus=2
set number

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

inoremap jj <Esc>

execute pathogen#infect()
syntax on
filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab


augroup vimrcEx
  autocmd!
  
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spell checking
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell

augroup END

set textwidth=80
set colorcolumn=+1

set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set nowrap
