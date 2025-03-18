require("lint").linters_by_ft = {
  javascript = { 'eslint', 'biome' },
  typescript = { 'eslint', 'biome' }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function ()
    require("lint").try_lint()
  end,
})


