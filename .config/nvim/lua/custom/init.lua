vim.opt.colorcolumn = "80"
vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.wildignore:append({ "*/.nx/*" })
vim.opt.wildignore:append({ "*/.husky/*" })
vim.opt.wildignore:append({ "*/build/*" })
vim.opt.wildignore:append({ "*/dist/*" })
vim.opt.wildignore:append({ "*/tempo-data/*" })
vim.opt.wildignore:append({ "*/.react-router/*" })
vim.opt.wildignore:append({ "*/.vinxi/*" })
vim.opt.wildignore:append({ "*/.vscode/*" })

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
