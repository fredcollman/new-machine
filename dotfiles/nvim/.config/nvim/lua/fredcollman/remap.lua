vim.g.mapleader = " "

vim.g.fred_example = 1
-- TODO less brittle way of getting to the config file?
-- I used to use $MYVIMRC
vim.keymap.set("n", "<leader>v", function() vim.cmd.edit("/home/fred/.config/nvim/init.lua") end)

-- open cwd
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
