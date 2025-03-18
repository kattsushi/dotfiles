local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")

lspconfig.biome.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      provideFormatter = false,
      disableSuggestions = true,
    }
  }
}
