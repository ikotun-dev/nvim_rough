-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          keys = {
            { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          },
          capabilities = {
            offsetEncoding = { "utf-8" }, -- Ensure utf-8 for tsserver
          },
        },
        clangd = {
          capabilities = {
            offsetEncoding = { "utf-8" }, -- Corrected: should be an array
          },
          filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
          cmd = {
            "clangd",
            "--offset-encoding=utf-8",
          },
        },
      },
    },
  },
}
