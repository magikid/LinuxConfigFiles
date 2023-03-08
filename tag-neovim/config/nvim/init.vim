" Load up plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins to install
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')
" monokai theme
Plug 'crusoexia/vim-monokai'
" Make tmux and vim play nicely between panes
Plug 'christoomey/vim-tmux-navigator'
" Quick navigation using Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
" Align text based on character e.g. :Tab /, will align rows at comma
Plug 'godlygeek/tabular'
" Pretty file tree panel
Plug 'scrooloose/nerdtree'
" Add git status to nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Automatically adds end statements in Ruby, ZSH, Elixir, maybe twig?
Plug 'tpope/vim-endwise'
" Better handling of git files
Plug 'tpope/vim-git'
" wakatime.com integration
Plug 'wakatime/vim-wakatime'
" Git integration
Plug 'tpope/vim-fugitive'
" Shows git status (add, remove, change) in gutter
Plug 'airblade/vim-gitgutter'
" Color parens different colors per level
Plug 'kien/rainbow_parentheses.vim'
" fuzzy finder support for nvim
Plug 'junegunn/fzf'
" Comment stuff out more easily, try gcc
Plug 'tpope/vim-commentary'
" Automatically set tabs based on current file tabs
Plug 'tpope/vim-sleuth'
" Fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Add matching braces and quotes automagically
Plug 'jiangmiao/auto-pairs'
" Handle continuation lines in Python right
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
" Allow writing to unwritable files by piping through sudo
Plug 'lambdalisue/suda.vim'
call plug#end()

" Always use utf-8
set encoding=utf-8
" Allow backspace over autoindents, line breaks, and line starts
set bs=indent,eol,start
" ¯\_(ツ)_/¯ something about marks in files
set viminfo='20,\"500
" Show the line and column number in the bottom right
set ruler
" Enable syntax highlighting
syntax on
" Auto detect file type of edited files
filetype plugin on
" Wait 1 second and then start blinking the cursor
set guicursor = "a:blinkwait1000"
" Show the matching bracket, paren
set showmatch
" Show the matching bracket or paren for 2/10 seconds
set matchtime=2
" Add angle brackets to match on
set matchpairs+=<:>
" Keep two lines above and below the cursor when scrolling
set scrolloff=2
" When scrolling horizontally, move by a single column at a time
set sidescroll=5
" Keep 20 columns to left/right when scrolling horizontally
set sidescrolloff=20
" Show the mode (Insert, Replace, Visual) on the bottom on vim
set showmode
" Set the title of the terminal
set title
" Don't actually close files until quitting out of vim as a whole
set hidden
" Don't wrap long lines
set nowrap

" Use two spaces for tab and expand out any <Tab>s to spaces
set tabstop=2
" Use two spaces for autoindent tabs
set shiftwidth=2
" Round tab spaces to a multisple of shiftwidth
set shiftround
" Don't use tabs, only use spaces.  For a hard tab hit Ctrl-V<Tab> in insert
" mode
set expandtab

" When doing a horizontal split, open the new pane below the current one
set splitbelow
" When doing a vertical split, open the new pane to the right of the current one
set splitright

" Store undo actions for a file in a file
set undofile
" Store all undofiles in this directory
set undodir=~/.config/nvim/undos
" I'm not sure what this does, can't find anything about it
let s:undos = split(globpath(&undodir, '*'), "\n")
" Looks like this might delete old undo files?
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 90)')
" Same for this one, no idea what it does
call map(s:undos, 'delete(v:val)')

" Make it easier to jump between split panes with Ctrl-h etc instead of Ctrl-w,h
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use jj to escape insert mode and return to normal mode
imap jj <Esc>

" Show line numbers
set number
" Show relative line numbers
set relativenumber
" Allow virtual editing in visual block mode (Not sure what exactly this
" means?)
set virtualedit=block

" Turns on syntax highlighting
syntax enable
" Load plugins and indent settings based on filetypes
filetype plugin indent on

" Create autocommand group for spell checking and tag generation
augroup spellingAug
  " Clear out this autocommand group on load
  autocmd!
  " Spell check markdown files
  autocmd FileType markdown setlocal spell
  autocmd FileType md setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell textwidth=80
  " Spell check txt files
  autocmd BufRead,BufNewFile *.txt setlocal spell textwidth=80
  " Spell check git commit docs
  autocmd FileType gitcommit setlocal spell
  " Spell check mercurial commits
  autocmd BufNewFile,BufRead hg-editor-*.txt setlocal spell textwidth=80
  " Spell check for jrnl entries
  autocmd BufRead,BufNewFile *.jrnl setlocal spell textwidth=80
augroup end

augroup pythonStuffAug
  " Use PEP 8 indentation for python files
  " 4 spaces for each tab
  " Max 79 chars per line
  " Use spaces for tabs, not hard tabs
  autocmd BufNewFile,BufRead *.py
      \ set tabstop=4
      \ set softtabstop=4
      \ set shiftwidth=4
      \ set textwidth=79
      \ set expandtab
      \ set autoindent
      \ set fileformat=unix
  " Highlight trailing whitespace
  autocmd BufRead,BufNewFile *.py,*.pyw match OverLength /\s\+$/
augroup end

" Map <Ctrl>-p to controlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ignore app/cache, _build, node_modules, target, dist, deps, .git, .hg, .svn
" folders; .out, .data files when doing Ctrl-P
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](app[\/]cache|_build|node_modules|target|dist|deps)|\.(git|hg|svn)\$',
    \ 'file': '\v\.(out|data)$',
    \ }

" Use ripgrep for ctrlp and grepping
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 1
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" Make lines longer than 80 chars red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Use only \n for newlines
set fileformat=unix

" Neomake config
" Check if my laptop is running on battery power
function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

" Set tab and trailing space characters
set list listchars=tab:»·,trail:·

" Also use <Space> to toggle search highlighting
nmap <Space> :set hlsearch!<CR>

" Use the * clipboard
set clipboard=unnamed

" NERDTree Settings
" The next two lines cause NERDTree to launch when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim when only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Turn on colors
set termguicolors
" Set theme to monokai
colorscheme monokai

" RainbowParenthesis are always on everywhere they can be
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ignore .git folder, tmp folders, any .swp files, and the node_modules folder
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/node_modules/*

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Don't use standard tmux navigator mappings
let g:tmux_navigator_no_mappings = 1
" Use the hjkl keys to navigate between tmux and vim panes
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" The length of time (in ms) vim waits before triggering some plugins like git gutter
set updatetime=300

" Use fzf for vim
set rtp+=/usr/local/opt/fzf

" Set the airline statusbar theme
let g:airline_theme="bubblegum"

" Use this specific python2
let g:python_host_prog='/usr/bin/python'
" Use this specific python3
let g:python3_host_prog='/usr/bin/python3'

" set completeopt=noinsert,menuone,noselect
inoremap <c-c> <ESC>

""" Leader key shortcuts
" Set <Leader> to a space
let mapleader = " "
" Use leader-f to toggle folding code
nnoremap <leader>f za
" Open NERDTree to the current file
nmap <leader>n :NERDTreeFind<CR>
" Close NERDTree
nmap <leader>m :NERTreeClose<CR>

""" Function key shortcuts
" Toggle the NerdTree pane with F1
nnoremap <F1> :NERDTreeToggle<CR>
" Previous tab with F2
map <F2> :tabprevious<CR>
" Next tab with F3
map <F3> :tabnext<CR>
" Close a tab with F4
map <F4> :tabclose<CR>
" Map F7 to search through tags
map <F7> :CtrlPTag<CR>
" Remove all trailing whitespace by pressing F8
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
