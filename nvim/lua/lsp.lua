-- https://github.com/williamboman/mason-lspconfig.nvim#setup order is important!
require("mason").setup()
require("mason-lspconfig").setup()

local nvim_lsp = require('lspconfig')

nvim_lsp.volar.setup{}
nvim_lsp.ruff_lsp.setup{}
nvim_lsp.pyright.setup{}
nvim_lsp.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        rope_autoimport = {
          enabled = true,
          completions = {
            enabled = true
          },
          code_actions = {
            enabled = true
          }
        }
      }
    }
  }
}
nvim_lsp.tsserver.setup{}
nvim_lsp.bashls.setup{}

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, noremap = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>cu', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

-- local cmp = require('cmp')

-- disable automatic hover text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false
  }
)

-- nvim-lightbulb can show when there are code actions
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- cmp.setup({
--     mapping = {
--       ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.close(),
--       ['<CR>'] = cmp.mapping.confirm({
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = true,
--         })
--     },
--     sources = {
--       { name = 'nvim_lsp' },
--       { name = 'buffer' },
--     }
--   })
