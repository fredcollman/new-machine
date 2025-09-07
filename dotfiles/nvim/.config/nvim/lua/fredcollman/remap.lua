vim.keymap.set("n", "<leader>v", function() 
  vim.cmd.edit(os.getenv("MYVIMRC"))
end)

-- open cwd
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- cursor stays in the middle when going through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pasting over something should not replace the paste register
-- i.e. delete the current selection, putting it in the null register (rather than the 0 register), then paste
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent: true })
