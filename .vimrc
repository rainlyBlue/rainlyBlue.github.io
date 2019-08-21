syntax on

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

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

call plug#begin('~/.vim/autoload')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'iamcco/markdown-preview.nvim'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'     

call plug#end()

"NerdTree config
map tt :NERDTreeToggle<CR>

"Ycm
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>|
nnoremap g/ :YcmCompleter GetDoc<CR>|
nnoremap gt :YcmCompleter GetType<CR>|
nnoremap gr :YcmCompleter GetReferences<CR>|

" YouCompleteMe
set runtimepath+=~/.vim/autoload/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/autoload/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项

"ale
let b:ale_linters=['pylint']
let b:ale_fixers=['autopep8', 'yapf']

"Taglsit
map <silent> T :TagbarOpenAutoClose<CR>


au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
