-- LSP wrapper for "classic" CLI tools
-- none-ls is a fork of null-ls, which is no longer maintained
return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
      sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
        -- (untested)
        -- null_ls.builtins.diagnostics.ansiblelint,
        -- null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.diagnostics.sqruff,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        -- null_ls.builtins.formatting.shfmt,
        -- null_ls.builtins.formatting.sqruff,

        -- not needed (dprint)
        -- null_ls.builtins.formatting.prettier,
      }
    })
  end
}
