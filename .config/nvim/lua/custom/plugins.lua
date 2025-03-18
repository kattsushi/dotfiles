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
        "lua-language-server",
        "tailwindcss-language-server"
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
  {
    "windwp/nvim-ts-autotag",
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      opts = require("plugins.configs.treesitter")
      opts.ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "tsx",
        "css"
      }
      return opts
    end
  }
}
return plugins
