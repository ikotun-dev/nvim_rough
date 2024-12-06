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

-- for GRUG
vim.api.nvim_set_keymap("n", "<G>", ":YourCommandHe", { noremap = true })

-- Set encoding to UTF-8
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

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
