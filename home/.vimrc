set nocompatible
filetype off
syntax enable



" Vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/Syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'mxw/vim-jsx'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'

call vundle#end()

filetype plugin indent on

" Remember last line
"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Colors
colorscheme BlackSea

" Powerline setup

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


nmap <Tab> :CtrlPBuffer<CR>

" Make leader spacebar
let mapleader = "\<Space>"

:set encoding=utf-8
:set fileencodings=utf-8
:set expandtab
:set tabstop=2
:set softtabstop=4
:set ignorecase
:set number
:set hlsearch
:set incsearch
:set smarttab
:set autoindent
:set nobackup
:set noswapfile
:set history=1000
:set smartindent
:set title
:set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
:set ruler
:set t_ut=
:set t_Co=256

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" per-syntax

au FileType go setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType html setl sw=2 sts=2 et
au FileType hbs setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType coffee setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType vue setl sw=2 sts=2 et
au FileType jade setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType elixir setl sw=2 sts=2 et

" buffers
nmap <Leader>b :buffers<CR>:buffer<Space>
nmap <Leader>bd :bdelete<CR>
nmap <Leader>bc :Bclose<CR>

" disable visual bells
"
:set novb
:set noerrorbells

autocmd GUIEnter * set visualbell t_vb=
autocmd VimEnter * set visualbell t_vb=


" Autoformat
"
noremap <F3> :Autoformat<CR>
let g:formatters_python = ['autopep8']

" Sort Python imports
autocmd FileType python nnoremap <Leader>i :!isort -m3 -tc %<CR><CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Remove trailing whitespace on save
"
autocmd BufWritePre * :%s/\s\+$//e

" Reload settings
nmap <F5> :source ~/.vimrc<CR>

" Open
nnoremap <Leader>e :e<Space>

" Save
nnoremap <Leader>w :w<CR>

" Visual mode: Space+Space
nmap <Leader><Leader> V

"System clipboard
"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Silver Searcher
"
let g:ackprg = 'ag --nogroup --nocolor --column'

" Syntastic
let g:syntastic_aggregate_errors = 1
" let g:syntastic_debug = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height  = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_javascript_jslint_args = ' '

autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['jshint']

let g:jsx_ext_required = 0 "Allow syntax highlighting in non-jsx files"

"GVIM specific
"
if has('gui_running')
   " Colorscheme
   "
  colorscheme BlackSea

  set guioptions-=e
  set guioptions-=l
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guiheadroom=0

endif
