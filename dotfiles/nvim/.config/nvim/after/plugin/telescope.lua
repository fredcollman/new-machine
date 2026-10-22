-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#usage

local builtin = require('telescope.builtin')

-- normal search
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Telescope Git files' })

-- includes e.g. node_modules
vim.keymap.set('n', '<leader>fa', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })

-- relies on tags?
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })

-- Primeagen's alternative project search
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({
    search = vim.fn.input("Grep > ")
  });
end)

-- old: nnoremap <leader>u :Rg <C-R><C-W>\b<CR>
vim.keymap.set('n', '<leader>u', builtin.grep_string, { desc = 'Telescope grep under cursor' })
