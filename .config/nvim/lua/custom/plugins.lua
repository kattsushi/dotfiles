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
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false, -- Muestra archivos ocultos que comienzan con "."
          custom = {
            "node_modules",
            ".nx",
            ".husky",
            "build",
            "dist",
            "tempo-data",
            ".react-router",
            ".vinxi",
            ".vscode",
            ".git",
            "package-lock.json",
            "bun.lockb"
          },
        },
      })
    end
  }
}
return plugins
