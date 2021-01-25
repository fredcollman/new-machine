let mapleader = "\<Space>"

" open vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" use minpac for plugins
" https://github.com/k-takata/minpac
packadd minpac
call minpac#init()

" allow minpac to update itself
call minpac#add('k-takata/minpac', {'type': 'opt'})

" gcc gca{ gcip -> toggle commented line, body, paragraph
call minpac#add('tpope/vim-commentary')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
