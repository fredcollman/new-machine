-- connects built-in Neovim LSP client to standard LSP servers
return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.enable({
      'pyright',
      'ruff',
      'lua_ls',
      -- use vtsls instead
      -- 'ts_ls',
      'vtsls',
      'dprint',
      'svelte',
      'astro',
      -- TODO eslint: only on save, too noisy otherwise!
      -- 'eslint',
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

    vim.lsp.config("vtsls", {
      settings = {
        typescript = {
          tsserver = {
            -- https://github.com/yioneko/vtsls?tab=readme-ov-file#typescript-plugin-not-activated
            pluginPaths = { "./node_modules" }
          },
          format = {
            convertTabsToSpaces = false
          },
        },
        vtsls = {
          -- https://github.com/yioneko/vtsls?tab=readme-ov-file#typescript-plugin-not-activated
          autoUseWorkspaceTsdk = true,
          typescript = {
            format = {
              convertTabsToSpaces = false
            },
          }
        }
      },
      filetypes = {
        'javascript',
        'javascriptreact',
        -- 'javascript.jsx',
        'typescript',
        'typescriptreact',
        -- 'typescript.tsx',
        'astro'
      },
      -- ref: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/vtsls.lua
      root_dir = function(bufnr, on_dir)
        -- The project root is where the LSP can be started from
        -- As stated in the documentation above, this LSP supports monorepos and simple projects.
        -- We select then from the project root, which is identified by the presence of a package
        -- manager lock file.
        local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
        -- Give the root markers equal priority by wrapping them in a table
        root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers, { '.git' } }
            or vim.list_extend(root_markers, { '.git' })
        -- exclude deno (only if lockfile present)
        -- local deno_root = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' })
        local deno_lock_root = vim.fs.root(bufnr, { 'deno.lock' })
        local project_root = vim.fs.root(bufnr, root_markers)
        if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
          -- deno lock is closer than package manager lock, abort
          return
        end
        -- if deno_root and (not project_root or #deno_root >= #project_root) then
        --   -- deno config is closer than or equal to package manager lock, abort
        --   return
        -- end
        -- project is standard TS, not deno
        -- We fallback to the current working directory if no project root is found
        on_dir(project_root or vim.fn.getcwd())
      end,
    })

    vim.lsp.config("svelte", {
      settings = {
        svelte = {
          plugin = {
            svelte = {
              format = {
                enable = false,
              }
            },
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
              vim.lsp.buf.format({
                async = false,
                bufnr = ev.buf,
                id = client.id,
                -- timeout_ms = 1000,
                -- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save#choosing-a-client-for-formatting
                filter = function(c)
                  -- print(c.name) -- for debugging
                  -- use dprint instead of ts_ls for formatting
                  return c.name ~= 'vtsls' and c.name ~= "null-ls"
                end
              })
            end,
          })
        end
      end
    })
  end
}
