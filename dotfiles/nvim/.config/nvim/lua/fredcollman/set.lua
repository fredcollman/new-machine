vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- plays nicely with undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- possibly?
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = true

vim.g.mapleader = " "

-- ignore case for search, unless search is mixed case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- show line numbers relative to current line
vim.opt.number = true
vim.opt.relativenumber = true

-- https://www.reddit.com/r/neovim/comments/s3i0ez/how_to_avoid_having_to_install_neovim_in_every/
if vim.fn.exists("$VIRTUAL_ENV") == 1 then
  vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("which -a python3 | head -n2 | tail -n1"), "\n", "", "g")
else
  vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system("which python3"), "\n", "", "g")
end
