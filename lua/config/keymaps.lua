-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local set = vim.keymap.set

set("n", ",1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
set("n", ",2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
set("n", ",3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
set("n", ",4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
set("n", ",5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
set("n", ",6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
set("n", ",7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
set("n", ",8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
set("n", ",9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" })
set("n", ",0", "<cmd>BufferLineGoToBuffer 0<cr>", { desc = "Buffer 0" })

set("n", "<leader><tab><tab>", "<cmd>tablast<cr>", { desc = "Last tab" })
set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New tab" })
set("n", "<leader>wo", "<cmd>only<cr>", { desc = "Focus window" })
set("n", "<leader>wq", "<cmd>q<cr>", { desc = "Quit window" })

local picker = require("window-picker")
set("n", "\\", function()
  local picked_window_id = picker.pick_window({
    include_current_win = true,
  }) or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

set("n", "<leader>cs", "<cmd>ISwapWith", { desc = "Swap cursor with ..." })
set("n", "<leader>ga", "<cmd>GitCoAuthors", { desc = "Add Co-Authors" })

set("n", "[<space>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Empty line above" })
set("n", "]<space>", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Empty line below" })
