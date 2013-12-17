if has('vim_starting')
  set nocompatible
  set runtimepath +=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

set encoding=utf-8
set fileencoding=utf-8
set number

filetype on
filetype plugin on
filetype indent on

set splitbelow
set autowrite
set smartindent
set autoindent
set ruler
set wrapscan
set backspace=2
set colorcolumn=80
set timeoutlen=500
set incsearch
set ignorecase
set smartcase
set hlsearch
set showcmd
set wrap
set textwidth=79

set ts=2 sts=2 sw=2 expandtab
if has("autocmd")
  filetype on
  autocmd FileType make setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd BufWritePre *.js,*.css,*.scss,*.rb :call <SID>StripTrailingWhitespaces()
endif

noremap : <NOP>
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
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'othree/html5.vim'
NeoBundleCheck

colorscheme solarized
set background=dark
syntax on

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
