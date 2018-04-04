if &compatible
  set nocompatible
endif
set runtimepath+=/Users/calebtroughton/dein.vim/repos/github.com/Shougo/dein.vim

call dein#begin('/Users/calebtroughton/dein.vim')

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
  autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
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

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)

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

call dein#add('Shougo/dein.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('Raimondi/delimitMate')
call dein#add('sheerun/vim-polyglot')
call dein#end()

if dein#check_install()
  call dein#install()
endif

colorscheme solarized
set background=dark
syntax on
filetype plugin indent on

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let delimitMate_expand_cr = 1
