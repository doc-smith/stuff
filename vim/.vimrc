call pathogen#infect()

set t_Co=256
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

syntax on
set background=dark
colorscheme solarized
filetype plugin indent on

set nocompatible
set number
set history=1000

set hidden

set backspace=indent,eol,start
set linespace=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set autoindent
set smartindent
set colorcolumn=80

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set foldmethod=indent
set foldlevel=99

set laststatus=2
set noruler
set statusline=%<%{CurTime()}\ %1*%f%*\ %l,%c\ %P
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

abbreviate #i #include
abbreviate #d #define
abbreviate #p #pragma once

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" plugins
"

" vim ack
nmap <leader>a <Esc>:Ack<space>

" nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
nmap <leader>nt :NERDTree<return>

" clang complete
let g:clang_close_preview = 1

" functions
"
function! CurTime()
ruby << EOF
    VIM::command("return '#{Time.now.strftime("%I:%M%p")}'")
EOF
endfunction

" random ui32
function! RandomHex()
ruby << EOF
    @buffer = VIM::Buffer.current
    line = VIM::Buffer.current.line_number
    @buffer.append(line, "0x%08x" % (rand * 0xffffffff))
EOF
endf

nmap <leader>rnd <Esc>:call RandomHex()<return>
