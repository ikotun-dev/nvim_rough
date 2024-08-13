-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lazy").setup({
  { "codota/tabnine-nvim", build = "./dl_binaries.sh" },
})
vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

vim.g.copilot_no_tab_map = true

-- Set encoding to UTF-8

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
