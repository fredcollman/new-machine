local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.git_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>/", builtin.live_grep)
