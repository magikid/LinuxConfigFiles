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
set list listchars=tab:»·,trail:·,nbsp:·,extends:>,precedes:<
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

let g:NERDTreeDirArrows=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Make lines longer than 80 chars red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Sends rspec to its own tmux pane
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
