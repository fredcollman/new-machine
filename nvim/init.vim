" map leader before anything else, so it gets picked up in lua configs
let mapleader = "\<Space>"

" load plugins first (and other lua config)
lua require 'fred'

" open vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

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
\ 'python': ['isort', 'black', 'autoflake'],
\ 'javascript': ['prettier'],
\ 'javascriptreact': ['prettier', 'eslint'],
\ 'json': ['prettier'],
\ 'css': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier'],
\ 'vue': ['prettier'],
\ 'elixir': ['mix_format'],
\ 'terraform': ['terraform'],
\ 'sh': ['shfmt'],
\ 'yaml': ['prettier'],
\}
let g:ale_linters = {
\ 'vue': ['volar']
\}
let g:ale_sign_column_always = 1
let g:ale_echo_msg_warning_str = '⚠️'
let g:ale_echo_msg_error_str = '💥'
let g:ale_echo_msg_format = '%severity% %linter% says %s'
let g:ale_completion_enabled = 1
" let g:ale_completion_delay = 1

" until I can figure out how to get LSP hover working
let g:ale_disable_lsp = 0
let g:ale_python_pyright_config = {
\ 'pyright': {
\   'disableLanguageServices': v:true,
\ },
\}

" packadd deoplete.nvim
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})
" call deoplete#enable()
nnoremap <leader>h :ALEHover<CR>

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

" allow switching buffers when current buffer has unsaved changes
set hidden

command! FormatJSON %!python -m json.tool
nnoremap =j :FormatJSON<CR>

nnoremap <leader>m :!mkdir -p <C-r>=expand("%:h")<CR>/<CR>
nnoremap <leader>x :!chmod +x %<CR>
nnoremap <leader>w :!sensible-browser %<CR>

nnoremap <leader>e :e .env<CR>
nnoremap <leader>gb :Git blame<CR>

" MaxMEllon/vim-jsx-pretty installed via vim-polyglot
let g:vim_jsx_pretty_highlight_close_tag = 1

let g:user_emmet_expandabbr_key='<C-e>'

colorscheme molokai
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
" luochen1990/rainbow rainbow parens/HTML nesting
let g:rainbow_active = 1
" machakann/vim-highlightedyank show yanked region
let g:highlightedyank_highlight_duration = 350

" fzf.vim shortcuts
" nnoremap <leader>f :GFiles<CR>
" nnoremap <leader>b :Buffers<CR>
nnoremap <leader>u :Rg <C-R><C-W>\b<CR>
" muscle memory: clobber Ag to use Rg instead
cabbrev Ag Rg
" and deal with casing issues
cabbrev ag Rg

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

  tnoremap <C-q> <C-\><C-n>
endif
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" <A-r> -> paste from register in terminal mode
" (do not clobber <C-r> shell history search)
" via https://thoughtbot.com/upcase/videos/neovim-pasting-into-a-terminal-buffer
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

" avoid nested Neovims
" requires pip install neovim-remote
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait"
endif

source <sfile>:h/local/*.vim

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

