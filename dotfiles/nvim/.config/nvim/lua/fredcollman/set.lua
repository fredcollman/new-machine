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
