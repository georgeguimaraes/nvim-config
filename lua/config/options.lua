-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.scrolloff = 2
vim.opt.swapfile = false
vim.g.deprecation_warnings = false
vim.opt.relativenumber = false

if vim.g.neovide then
  vim.opt.guifont = "FiraCodeGG Nerd Font:h16"
  vim.g.neovide_remember_window_size = true
end

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

vim.g.lazyvim_ruby_lsp = "solargraph"
