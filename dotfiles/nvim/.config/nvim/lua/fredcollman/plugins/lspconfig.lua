-- connects built-in Neovim LSP client to standard LSP servers
return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.enable({
      'pyright',
      'ruff',
      'lua_ls',
      'ts_ls',
      'dprint',
      'svelte',
    })

    -- -- https://gpanders.com/blog/whats-new-in-neovim-0-11/
    -- vim.api.nvim_create_autocmd('LspAttach', {
    --   callback = function(ev)
    --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
    --     if client:supports_method('textDocument/completion') then
    --       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    --     end
    --   end,
    -- })

    vim.diagnostic.config({ virtual_lines = true })

    vim.lsp.config("ts_ls", {
      settings = {
        typescript = {
          format = {
            convertTabsToSpaces = false
          },
        }
      }
    })

    vim.lsp.config("svelte", {
      settings = {
        svelte = {
          plugin = {
            svelte = {
              format = {
                enable = false,
              }
            }
          }
        }
      },
    })

    vim.lsp.config("dprint", {
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'jsonc',
        'markdown',
        'svelte',
        -- 'python',
        -- 'toml',
        -- 'rust',
        -- 'roslyn',
        -- 'graphql',
      },
    })


    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp", { clear = true }),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- https://gpanders.com/blog/whats-new-in-neovim-0-11/
        -- autocomplete on every keystroke?!
        -- may want to disable
        -- if client:supports_method('textDocument/completion') then
        --   vim.lsp.completion.enable(true, client.id, ev.buf, {
        --     autotrigger = true,
        --     convert = function(item)
        --       return { abbr = item.label:gsub('%b()', '') }
        --     end,
        --   })
        -- end

        -- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.format({ async = false, bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end
    })
  end
}
