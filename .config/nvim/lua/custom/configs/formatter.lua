local M = {}

function M.setup()
  local formatter = require('formatter.defaults.biome')

  require("formatter").setup({
    filetype = {
      javascript = formatter,
      javascriptreact = formatter,
      typescript = formatter,
      typescriptreact = formatter,
    }
  })

  -- Automáticamente formatear el buffer antes de guardar
  vim.api.nvim_create_augroup('FormatOnSave', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'FormatOnSave',
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    callback = function()
      vim.defer_fn(function()
        vim.cmd('FormatWrite')  -- Ejecuta el formateador con un pequeño retardo
      end, 100)  -- Retardo de 100ms
    end,
  })
end

return M
