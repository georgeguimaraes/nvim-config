-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.cmd([[
  autocmd BufRead,BufNewFile *.eex set filetype=eex
  autocmd BufRead,BufNewFile *.html.eex set filetype=heex
  autocmd BufRead,BufNewFile *.leex set filetype=eex
]])
