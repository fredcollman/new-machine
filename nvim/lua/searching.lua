local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.git_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>/", builtin.live_grep)

-- open file under cursor in vertical split
vim.keymap.set("n", "<leader>gf", "<cmd>:vsplit <cfile><cr>")
vim.keymap.set("n", "<leader>gd", "<c-w><c-v><c-]>")
