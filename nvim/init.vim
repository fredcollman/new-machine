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

  " <C-e> (= user_emmet_expandabbr_key) -> expand HTML shorthand
  call minpac#add('mattn/emmet-vim')

  " fuzzy matching (system util, plus common vim bindings)
  call minpac#add('junegunn/fzf', { 'do': '!./install --bin' })
  call minpac#add('junegunn/fzf.vim')

  call minpac#add('luochen1990/rainbow')
  call minpac#add('machakann/vim-highlightedyank')
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

" ALE adjustments
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'python': ['autoimport', 'black', 'isort'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'css': ['prettier'],
\}
let g:ale_sign_column_always = 1
let g:ale_echo_msg_warning_str = '⚠️'
let g:ale_echo_msg_error_str = '💥'
let g:ale_echo_msg_format = '%severity% %linter% says %s'


set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set fileformat=unix

set number
set relativenumber

" ignore case for search, unless search is mixed case
set ignorecase
set smartcase

set inccommand=split

" w should treat - as a word boundary
set iskeyword-=-


command! FormatJSON %!python -m json.tool
nnoremap =j :FormatJSON<CR>

nnoremap <leader>m :!mkdir -p <C-r>=expand("%:h")<CR>/<CR>
nnoremap <leader>x :!chmod +x %<CR>

" MaxMEllon/vim-jsx-pretty installed via vim-polyglot
let g:vim_jsx_pretty_highlight_close_tag = 1

let g:user_emmet_expandabbr_key='<C-e>'

colorscheme molokai
" luochen1990/rainbow rainbow parens/HTML nesting
let g:rainbow_active = 1
" machakann/vim-highlightedyank show yanked region
let g:highlightedyank_highlight_duration = 350

" fzf.vim shortcuts
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" navigate smoothly from terminal mode/between windows
" via https://thoughtbot.com/upcase/videos/neovim-creating-mappings-for-terminal
if has('nvim')
  " Esc -> exit terminal mode, with escape hatch
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-Esc> <Esc>
  " quickly switch windows using alt
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" <A-r> -> paste from register in terminal mode
" (do not clobber <C-r> shell history search)
" via https://thoughtbot.com/upcase/videos/neovim-pasting-into-a-terminal-buffer
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
