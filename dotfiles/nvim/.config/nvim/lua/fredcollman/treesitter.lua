-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file
-- context-aware syntax highlighting
-- for whatever reason, it doesn't want to run as a lazy plugin
require('lazy').setup({
  'nvim-treesitter/nvim-treesitter',
  as = 'nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate'
})

