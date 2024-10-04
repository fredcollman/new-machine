modules = {
  "./plugins",
  "./lsp",
  "./searching",
  "./snippets",
  "./treesitter",
}

function _G.reload_fred_config()
  for i, mod in pairs(modules) do
    if (vim.env.NEOVIM_DEBUG ~= nil) then
      print("Reloading", mod)
    end
    if pcall(require, 'plenary.reload') then
      require('plenary.reload').reload_module(mod)
    end
    require(mod)
  end
end

vim.cmd([[
  augroup reload_local_config
    autocmd!
    autocmd BufWritePost nvim/lua/*.lua lua reload_fred_config()
  augroup end
]])

_G.reload_fred_config()
