-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#setup
require'nvim-treesitter'.install({
  'css',
  'help',
  'html',
  'javascript',
  'python',
  'rust',
  'svelte',
  'typescript',
})

-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'css',
    'html',
    'javascript',
    'svelte',
    'typescript',
  },
  callback = function() vim.treesitter.start() end,
})
