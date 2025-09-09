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

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Esc -> exit terminal mode, with escape hatch
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<A-Esc>", "<Esc>")
-- quickly switch windows using alt
vim.keymap.set({"n", "t"}, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({"n", "t"}, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({"n", "t"}, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({"n", "t"}, "<A-l>", "<C-\\><C-n><C-w>l")

vim.keymap.set("n", "<leader>e", function() vim.cmd.edit(".env") end)
