local set_keymap = function(mode, keys, cmd)
  vim.api.nvim_set_keymap(mode, keys, cmd, { noremap = true, silent = true })
end

set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
set_keymap('n', '<leader>/', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
