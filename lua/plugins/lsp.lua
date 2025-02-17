-- return {
--   "jay-babu/mason-null-ls.nvim",
--   "sbdchd/neoformat",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     {
--       "williamboman/mason.nvim",
--       opts = {
--         ensure_installed = {
--           "eslint", -- you can specify version like "eslint@8.0.0"
--         },
--       },
--     },
--     "nvimtools/none-ls.nvim",
--     -- "neovim/nvim-lspconfig",
--
--     {
--       "neovim/nvim-lspconfig",
--       version = "*",
--       opts = {
--         -- rest of your options go here
--       },
--     },
--
--     {
--       "akinsho/toggleterm.nvim",
--     },
--     ts_ls = {
--       settings = {
--         format = { enable = false },
--         -- disable unused vars hint
--         diagnostics = { ignoredCodes = { -32603 } },
--       },
--     },
--   },
--   config = function()
--     local null_ls = require("null-ls")
--     local lspconfig = require("lspconfig")
--
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities.offsetEncoding = { "utf-8" }
--
--     null_ls.setup({
--       sources = {
--         -- null_ls.builtins.formatting.black,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.formatting.eslint,
--         require("typescript.extensions.null-ls.code-actions"),
--         require("none-ls.diagnostics.eslint_d"),
--       },
--       opts = {
--         ensure_installed = {
--           "eslint@4.8.0",
--         },
--       },
--     })
--
--     lspconfig.eslint.setup({
--       on_attach = function(client)
--         client.resolved_capabilities.document_formatting = true
--       end,
--       settings = {
--         format = { enable = true },
--       },
--     })
--
--     -- Setup clangd with utf-8 encoding
--     lspconfig.clangd.setup({
--       -- capabilities = {
--       --   offsetEncoding = { "utf-8" },
--       -- },
--       capabilities = capabilities,
--       filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
--       cmd = {
--         "clangd",
--         "--offset-encoding=utf-8",
--       },
--     })
--   end,
-- }

return {
  "jay-babu/mason-null-ls.nvim",
  "sbdchd/neoformat",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "eslint",
        },
      },
    },
    "nvimtools/none-ls.nvim",
    {
      "neovim/nvim-lspconfig",
      version = "*",
      opts = {},
    },
    {
      "akinsho/toggleterm.nvim",
    },
  },
  config = function()
    local null_ls = require("null-ls")
    local lspconfig = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { "utf-8" }

    -- Set up null-ls with ESLint
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint.with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
          end,
        }),
        null_ls.builtins.formatting.eslint,
      },
    })

    -- Don't set up ESLint through lspconfig if using null-ls
    -- Remove the lspconfig.eslint.setup({...}) block

    -- Setup clangd
    lspconfig.clangd.setup({
      capabilities = capabilities,
      filetypes = { "c", "cc", "cxx", "cpp", "objc", "objcpp" },
      cmd = {
        "clangd",
        "--offset-encoding=utf-8",
      },
    })
  end,
}
