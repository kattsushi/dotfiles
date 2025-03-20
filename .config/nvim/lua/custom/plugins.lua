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
      local opts = require("plugins.configs.treesitter")
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
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { ";c", "<cmd>LazyGit<CR>", desc = "Abrir LazyGit" }, -- Mapeo correcto
    },
    dependencies = {
      "nvim-lua/plenary.nvim" -- Dependencia opcional para ventanas flotantes
    },
    config = function()
      -- Configuración adicional de lazygit.nvim (opcional)
      require("lazygit").setup({
        floating_window_scaling_factor = 0.9, -- Escala de la ventana flotante
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add opts here
    },
    dependencies = {
      -- if you lazy load any plugin bellowm make sure to add proper module entries
      'MunifTanjim/nui.nvim',
      -- Optional: 
      --  ´nvim-notify´ is only needed, if you want to use the notification view.
      --  If no available , we use mini as fallback
      'rcarriga/nvim-notify'
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function ()
      require("lualine").setup {
        options = {
          theme = "catppuccin", -- Use the catppuccin theme for lualine
          section_separators = "", -- Optional ajust separators as needed
          component_separators = "",
          icons_enabled = true,
          disabled_filetypes = { 'packer', 'NVimTree_1' },
          -- you can further customize the sections _1from here
          sections = {
            lualine_a = {
              'mode',
            },
            lualine_b = {
              'branch', 'diff', 'diagnostics',
            },
            lualine_c = { 'filename' },
            lualine_x = { 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
          }
        }
      }
    end
  },
}
return plugins
