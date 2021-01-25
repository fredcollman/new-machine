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

endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! ReloadVimrc source $MYVIMRC | PackUpdate

if has('autocmd')
  augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost init.vim ReloadVimrc
  augroup END "}
endif

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'python': ['autoimport', 'black', 'isort']
\}
  " 'add_blank_lines_for_python_control_statements' - Add blank lines before control statements.
  " 'autoimport' - Fix import issues with autoimport.
  " 'autopep8' - Fix PEP8 issues with autopep8.
  " 'black' - Fix PEP8 issues with black.
  " 'isort' - Sort Python imports with isort.
  " 'remove_trailing_lines' - Remove all blank lines at the end of a file.
  " 'reorder-python-imports' - Sort Python imports with reorder-python-imports.
  " 'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
  " 'yapf' - Fix Python files with yapf.

