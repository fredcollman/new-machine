-- TODO move away from UltiSnips and towards something LSP-friendly
-- [SirVer/ultisnips: UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!](https://github.com/SirVer/ultisnips)
return {
  "SirVer/ultisnips",
  config = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

    vim.keymap.set("n", "<Leader>s", "<cmd>UltiSnipsEdit<cr>")
  end
}
