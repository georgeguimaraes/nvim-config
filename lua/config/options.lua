-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.scrolloff = 2
vim.opt.swapfile = false
vim.g.deprecation_warnings = false

if vim.g.neovide then
  vim.opt.guifont = "FiraCodeGG Nerd Font:h16"
  vim.g.neovide_remember_window_size = true
end
