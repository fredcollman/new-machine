vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(
  -- packages installed at ~/.local/share/nvim/site/pack/packer/start
  function()
    -- self-updating
    use 'wbthomason/packer.nvim'

    -- lua utils
    use 'nvim-lua/plenary.nvim'

    --[[
      gcc -> (un)comment out line
      gca} -> (un)comment out (JS) function body
      gcip -> (un)comment paragraphy (Python function body)
    ]]
    use 'tpope/vim-commentary'

    --[[
      ysiW" -> add quotes around Word
      ds} -> delete surrounding braces
      cs)] -> convert Python tuple to list
    ]]
    use 'tpope/vim-surround'

    --[[
      ]q -> go to next in quicklist
      [b -> go to previous buffer
    ]]
    use 'tpope/vim-unimpaired'

    -- use . to repeat tpope things (surround, switch buffer, ...)
    use 'tpope/vim-repeat'

    -- linting and fixing
    use 'dense-analysis/ale'


    -- syntax highlighting: JSX, Jenkinsfile and more
    use 'sheerun/vim-polyglot'

    -- colour scheme
    use 'tomasr/molokai'

    -- <C-e> (= user_emmet_expandabbr_key) -> expand HTML shorthand
    use 'mattn/emmet-vim'

    -- <Tab> -> expand snippet
    use 'SirVer/ultisnips'

    -- fuzzy matching (system util, plus common vim bindings)
    use { 'junegunn/fzf', run = './install --bin' }
    use 'junegunn/fzf.vim'

    use 'luochen1990/rainbow'
    use 'machakann/vim-highlightedyank'

    -- project-specific config, e.g. set path+=
    use 'tpope/vim-projectionist'

    -- <leader>gb -> :GBlame -> git blame
    use 'tpope/vim-fugitive'

    -- list buffers in UI chrome
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- autocomplete (works in combination with ale and LSPs)
    -- use { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
    -- autocomplete (dedicated alternative via LSP)
    -- use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile' }

    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  end
  )
