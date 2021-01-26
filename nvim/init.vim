let mapleader = "\<Space>"

" open vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" use minpac for plugins
" https://github.com/k-takata/minpac
function! PackInit() abort
  packadd minpac
  call minpac#init()

  " allow minpac to update itself
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " gcc -> (un)comment out line
  " gca} -> (un)comment out (JS) function body
  " gcip -> (un)comment paragraphy (Python function body)
  call minpac#add('tpope/vim-commentary')

  " ysiW" -> add quotes around Word
  " ds} -> delete surrounding braces
  " cs)] -> convert Python tuple to list
  call minpac#add('tpope/vim-surround')

  " ]q -> go to next in quicklist
  " [b -> go to previous buffer
  call minpac#add('tpope/vim-unimpaired')

  " use . to repeat tpope things (surround, switch buffer, ...)
  call minpac#add('tpope/vim-repeat')

  " linting and fixing
  call minpac#add('dense-analysis/ale')

  " syntax highlighting: JSX, Jenkinsfile and more
  call minpac#add('sheerun/vim-polyglot')

  " colour scheme
  call minpac#add('tomasr/molokai')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! ReloadVimrc source $MYVIMRC "| PackUpdate

if has('autocmd')
  augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost init.vim ReloadVimrc
  augroup END "}
endif

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'python': ['autoimport', 'black', 'isort'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\}

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set fileformat=unix

set number
set relativenumber


command! FormatJSON %!python -m json.tool
nnoremap =j :FormatJSON<CR>

nnoremap <leader>m :!mkdir -p <c-r>=expand("%:h")<CR>/<CR>

" MaxMEllon/vim-jsx-pretty installed via vim-polyglot
let g:vim_jsx_pretty_highlight_close_tag = 1

colorscheme molokai
