-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

vim.cmd([[
  autocmd FileType elixir setlocal indentkeys-=0\|>
  autocmd FileType elixir setlocal indentkeys-=\|>
]])

-- Remove underline from CursorLine (for diffnotes.nvim)
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a", underline = false })

-- Start Neovim RPC server for remote file opening (Phoenix LiveReload, etc.)
-- Check if server is already running (v:servername is set when using --listen flag)
if vim.v.servername == "" then
  -- No server running, start one and let Neovim choose the path
  local socket_path = vim.fn.serverstart()
  vim.env.NVIM = socket_path
else
  -- Server already running (started with --listen flag), use existing
  vim.env.NVIM = vim.v.servername
end
