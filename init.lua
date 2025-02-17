-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("plugins.gitlens").setup()

require("lazy").setup({
  { "codota/tabnine-nvim", build = "./dl_binaries.sh" },
})
vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- vim.g.copilot_no_tab_map = true

-- for eslint
require("lspconfig").eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  settings = {
    workingDirectory = { mode = "auto" },
  },
})
-- for GRUG
vim.api.nvim_set_keymap("n", "<G>", ":YourCommandHe", { noremap = true })

-- for git blame
-- vim.api.nvim_command([[autocmd CursorHold   * lua require'utils'.blameVirtText()]])
-- vim.api.nvim_command([[autocmd CursorMoved  * lua require'utils'.clearBlameVirtText()]])
-- vim.api.nvim_command([[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]])
-- Set encoding to UTF-8
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- Set encoding to UTF-8
-- vim.o.encoding = "utf-8"
-- vim.o.fileencoding = "utf-8"
-- vim.o.fileencodings = "utf-8"

require("lspconfig").clangd.setup({
  capabilities = {
    offsetEncoding = "utf-8",
  },
  filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
})
