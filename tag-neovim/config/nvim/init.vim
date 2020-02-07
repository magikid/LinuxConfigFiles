" Load up plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins to install
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')
" Asynchronous linting and make framework
Plug 'neomake/neomake'
" solarized theme
Plug 'altercation/vim-colors-solarized'
" monokai theme
Plug 'crusoexia/vim-monokai'
" Make tmux and vim play nicely between panes
Plug 'christoomey/vim-tmux-navigator'
" Quick navigation using Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
" Elixir integration
Plug 'elixir-lang/vim-elixir'
" Allows you to use <Tab> for all your insert completion needs
Plug 'ervandew/supertab'
" A different tab completion library?
Plug 'ajh17/VimCompletesMe'
" Align text based on character e.g. :Tab /, will align rows at comma
Plug 'godlygeek/tabular'
" Run the tests for the current file (any lang), try :TestNearest or :TestFile
Plug 'janko-m/vim-test'
" Adding snippets, shortcut <C-y>,
Plug 'mattn/emmet-vim'
" Rust language support
Plug 'rust-lang/rust.vim'
" Pretty file tree panel
Plug 'scrooloose/nerdtree'
" Lots of rails integration, https://github.com/tpope/vim-rails
Plug 'tpope/vim-rails'
" Automatically adds end statements in Ruby, ZSH, Elixir, maybe twig?
Plug 'tpope/vim-endwise'
" Wraps ruby's bundler
Plug 'tpope/vim-bundler'
" wakatime.com integration
Plug 'wakatime/vim-wakatime'
" Twig syntax support
Plug 'lumiliet/vim-twig'
" Git integration
Plug 'tpope/vim-fugitive'
" Shows git status (add, remove, change) in gutter
Plug 'airblade/vim-gitgutter'
" Color parens different colors per level
Plug 'kien/rainbow_parentheses.vim'
" Go language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Adds language server support to nvim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" fuzzy finder support for nvim
Plug 'junegunn/fzf'
" Comment stuff out more easily, try gcc
Plug 'tpope/vim-commentary'
" Add use statements to PHP with <Leader>-u
Plug 'arnaud-lb/vim-php-namespace'
" Handle tags generation automatically
Plug 'ludovicchabant/vim-gutentags'
" PHP Syntax highlighting
Plug 'StanAngeloff/php.vim'
" Automatically set tabs based on current file tabs
Plug 'tpope/vim-sleuth'
" Fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Add matching braces and quotes automagically
Plug 'jiangmiao/auto-pairs'
" Adds php language server
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
call plug#end()

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

" Make it easier to jump between split panes with Ctrl-h etc instead of
" Ctrl-w,h
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Originally, these were to force me to use hjkl to navigate instead of
" arrows.  Now the up/down will scrolls through the neomake error list.
noremap <Up> :lprev<CR>
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Down> :lnext<CR>

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
augroup end

" Autocommand group for vim-php-namespace commands
augroup phpNameSpaceAug
  " Clear out this autocommand group on load
  autocmd!

  " Setup <Leader>-u to add use statement for object under cursor in normal mode
  autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
  " Sort php use statements with <Leader>-s in normal mode
  autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
augroup end
" Sort php use statements alphabetically after insert
let g:php_namespace_sort_after_insert = 1

" Autocmds related to tags generation and quickfix window
augroup tagAug
  autocmd!
  " Generate a tags file on save
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
augroup end

" Adds tags.vendor to tags path
set tags^=tags.vendor


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

" If we're running vim on batter, only run neomake on write, otherwise run it
" when writing, reading, inserting after 500ms
if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nrwi', 500)
endif
let g:neomake_open_list = 2

let g:neomake_php_phpcs_exe = '/Users/cjone0102/.composer/vendor/bin/phpcs'
let g:neomake_php_phpcs_args_standard = "Symfony2"
let g:neomake_php_enabled_makers = ['phpcs', 'phpstan']
let g:neomake_php_phpstan_args = "--autoload-file=app/autoload.php"

" Set tab and trailing space characters
set list listchars=tab:»·,trail:·

" Also use <Space> to toggle search highlighting
nmap <Space> :set hlsearch!<CR>
" Use dockertools for phpunit tests
let test#php#phpunit#executable = "./bin/dockertools phpunit"

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

" Use brew python3 and not the system version
let g:python3_host_prog = '/usr/local/bin/python3'

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

" LanguageClient config
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
let g:LanguageClient_loadSettings = 1

" Run cargo fmt on save
let g:rustfmt_autosave = 1

" Use fzf for vim
set rtp+=/usr/local/opt/fzf

" Set the airline statusbar theme
let g:airline_theme="bubblegum"

""" Leader key shortcuts
" Set <Leader> to a space
let mapleader = " "
" Run the closest test with <Space>t
nmap <silent> <leader>t :TestNearest<CR>
" Run all tests in the file with <Space>T
nmap <silent> <leader>T :TestFile<CR>
" Run the whole suite with <Space>a
nmap <silent> <leader>a :TestSuite<CR>

""" Function key shortcuts
" Toggle the NerdTree pane with F1
nnoremap <F1> :NERDTreeToggle<CR>
" Previous tab with F2
map <F2> :tabprevious<CR>
" Next tab with F3
map <F3> :tabnext<CR>
" Close a tab with F4
map <F4> :tabclose<CR>
" Open the langauge client menu
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Map F6 to running make
map <F6> :make<CR>
