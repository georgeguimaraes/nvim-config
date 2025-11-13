-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.swapfile = false
vim.g.deprecation_warnings = false
vim.opt.relativenumber = false

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

vim.opt.iskeyword:append("-")

vim.g.ai_cmp = false

-- mini.diff highlight colors from delta (.gitconfig)
vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#399a96" })
vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#6183bb" })
vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#b2555b" })
vim.api.nvim_set_hl(0, "MiniDiffOverAdd", { bg = "#399a96" })
vim.api.nvim_set_hl(0, "MiniDiffOverDelete", { bg = "#b2555b" })
vim.api.nvim_set_hl(0, "MiniDiffOverChange", { bg = "#c0caf5" })
vim.api.nvim_set_hl(0, "MiniDiffOverContext", { fg = "#394b70" })
