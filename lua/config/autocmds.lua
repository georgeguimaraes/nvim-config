-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- local group = vim.api.nvim_create_augroup("Elixir", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = "*.ex,*.exs",
--   group = group,
--   callback = function()
--     local ok, otter = pcall(require, "otter")
--     if ok then
--       otter.activate({ "markdown" })
--     end
--   end,
-- })

vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])

require("tokyonight").setup({
  plugins = { markdown = true },
})

require("avante_lib").load()
