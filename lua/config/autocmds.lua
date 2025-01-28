-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

vim.cmd([[
  autocmd FileType elixir setlocal indentkeys-=0\|>
  autocmd FileType elixir setlocal indentkeys-=\|>
]])
