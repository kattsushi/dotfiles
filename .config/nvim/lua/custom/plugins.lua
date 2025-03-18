local plugins = {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function ()
      require("custom.configs.formatter").setup()
    end,
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "biome",
        "eslint-lsp",
        "prettier",
        "lua-language-server"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
}
return plugins
