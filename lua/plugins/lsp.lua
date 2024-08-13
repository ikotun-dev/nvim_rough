return {
  "jay-babu/mason-null-ls.nvim",
  "sbdchd/neoformat",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local null_ls = require("null-ls")
    local lspconfig = require("lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { "utf-8" }

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
      },
    })

    -- Setup clangd with utf-8 encoding
    lspconfig.clangd.setup({
      -- capabilities = {
      --   offsetEncoding = { "utf-8" },
      -- },
      capabilities = capabilities,
      filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
      cmd = {
        "clangd",
        "--offset-encoding=utf-8",
      },
    })
  end,
}
