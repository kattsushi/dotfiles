local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")

-- Lista de servidores LSP
local servers = {
  {
    name = "biome",
    filetypes = {
      'astro',
      'css',
      'graphql',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'svelte',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'vue',
    },
    root_dir = lspconfig.util.root_pattern('biome.json', 'biome.jsonc'),
    single_file_support = false,
  },
  {
    name = "ts_ls",
    init_options = {
      preferences = {
        provideFormatter = false,
        disableSuggestions = true,
      }
    }
  },
  {
    name = "tailwindcss",
  },
  {
    name = "cssls"
  }
}

-- Configuración común para todos los servidores
local common_config = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Configurar cada servidor LSP
for _, server in ipairs(servers) do
  local server_config = vim.tbl_deep_extend("force", common_config, server)
  lspconfig[server.name].setup(server_config)
end

