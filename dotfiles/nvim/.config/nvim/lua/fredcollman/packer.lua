-- https://github.com/wbthomason/packer.nvim
-- > This repository is currently unmaintained. For the time being (as of August, 2023), it is recommended to use one of the following plugin managers instead: lazy.nvim or pckr.nvim
-- TODO: switch to lazy.nvim?
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nice finders
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colour scheme
  use({
	  "tomasr/molokai",
	  as = 'molokai',
	  config = function()
		  vim.cmd('colorscheme molokai')
	  end
  })

  -- context-aware syntax highlighting
  use({
	  'nvim-treesitter/nvim-treesitter',
	  branch = 'main',
	  run = ':TSUpdate'
  })

  -- branching undos/redos
  use('mbbill/undotree')

  -- git blame etc
  use('tpope/vim-fugitive')

  -- install LSPs
  use('mason-org/mason.nvim')
  -- for neovim >= 0.11 mason-lspconfig is no longer necessary

end)
