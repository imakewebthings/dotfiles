if has('vim_starting')
  set nocompatible
  set runtimepath +=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

set encoding=utf-8
set fileencoding=utf-8
set number

set splitbelow
set autowrite
set smartindent
set autoindent
set ruler
set wrapscan
set backspace=2
set so=5
set colorcolumn=80
set timeoutlen=500
set incsearch
set ignorecase
set smartcase
set hlsearch
set showcmd
set wrap

set ts=2 sts=2 sw=2 expandtab
if has("autocmd")
  autocmd FileType make setlocal ts=2 sts=2 sw=2 noexpandtab
  " Something is effing with vim-ruby, not highlighting Gemfiles
  autocmd BufNewFile,BufRead Gemfile set filetype=ruby 
  autocmd BufWritePre *.js,*.css,*.scss,*.rb :call <SID>StripTrailingWhitespaces()
endif

let mapleader=","

nnoremap <space> :
inoremap jk <esc>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

:command! W w
:command! Q q

set listchars=tab:▸\ ,eol:¬

function! <SID>StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'git@github.com:othree/html5.vim.git'
NeoBundle 'tpope/vim-liquid'
NeoBundleCheck

colorscheme solarized
set background=dark
syntax on
filetype on
filetype plugin on
filetype indent on


let delimitMate_expand_cr = 1

imap <expr> <TAB> emmet#expandAbbrIntelligent("\<tab>")
