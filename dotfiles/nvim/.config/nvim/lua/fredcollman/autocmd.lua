-- replaces https://github.com/machakann/vim-highlightedyank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    -- https://neovim.io/doc/user/lua.html#vim.hl.on_yank()
    vim.hl.on_yank()
  end
})
