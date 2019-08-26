
syntax on

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
autocmd BufEnter * call ncm2#enable_for_buffer()

set encoding=utf-8
let &t_ut=''

set tabstop=2
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start
set foldmethod=indent

set laststatus=2
set autochdir


set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap <LEADER><CR> :nohlsearch<CR>
noremap n nzz
noremap N Nzz

set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

map <C-Right> :set splitright<CR>:vsplit<CR>
map <C-Left> :set nosplitright<CR>:vsplit<CR>
map <C-Up> :set nosplitbelow<CR>:split<CR>
map <C-Down> :set splitbelow<CR>:split<CR>

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'Shougo/neosnippet.vim'
Plug 'ncm2/ncm2-neosnippet'
Plug 'ncm2/ncm2-pyclang'
"Plug 'ncm2/ncm2-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ObserverOfTime/ncm2-jc2'
Plug 'Raimondi/delimitMate'

call plug#end()

"NerdTree config
map tt :NERDTreeToggle<CR>

"ale
let b:ale_linters=['pylint']
let b:ale_fixers=['autopep8', 'yapf']

"Taglsit
map <silent> T :TagbarOpenAutoClose<CR>


au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

source ~/.vim/snippits.vim

"Ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

