if has('vim_starting')
  set nocompatible
  set runtimepath +=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

set encoding=utf-8
set fileencoding=utf-8
set number

filetype plugin on
filetype indent on
syntax on

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

nnoremap <space> :
inoremap jk <esc>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set listchars=tab:▸\ ,eol:¬

function! <SID>StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

