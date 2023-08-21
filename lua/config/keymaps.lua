-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local set = vim.keymap.set

set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" })
set("n", "<leader>0", "<cmd>BufferLineGoToBuffer 0<cr>", { desc = "Buffer 0" })
-- set("n", "<leader>;", "<cmd>e#<cr>", { desc = "Last Buffer" })

set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
set("n", "<leader>wo", "<cmd>only<cr>", { desc = "Focus window" })
set("n", "<leader>wq", "<cmd>q<cr>", { desc = "Quit window" })

local picker = require("window-picker")
set("n", "\\", function()
  local picked_window_id = picker.pick_window({
    include_current_win = true,
  }) or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

set("n", "<leader>cs", "<cmd>ISwapWith<cr>", { desc = "Swap cursor with ..." })
set("n", "<leader>ga", "<cmd>GitCoAuthors<cr>", { desc = "Add Co-Authors" })

local wk = require("which-key")
wk.register({ ["<leader>cj"] = { name = "Code Split/Join" } })
set("n", "<leader>cjm", "<cmd>TSJToggle<CR>", { desc = "Split/Join code block with autodetect" })
set("n", "<leader>cjj", "<cmd>TSJJoin<CR>", { desc = "Join code block" })
set("n", "<leader>cjs", "<cmd>TSJSplit<CR>", { desc = "Split code block" })

set("n", "[<space>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Empty line above" })
set("n", "]<space>", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Empty line below" })

set("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find Files, incl hidden (root dir)" })
set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files, incl hidden (root dir)" })
set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files (root dir)" })

set("n", "<D-b>", "<cmd>Telescope find_files<CR>")
set("n", "<D-o>", "<cmd>Telescope find_files<CR>")

set("n", "<C-A-h>", require("smart-splits").resize_left)
set("n", "<C-A-j>", require("smart-splits").resize_down)
set("n", "<C-A-k>", require("smart-splits").resize_up)
set("n", "<C-A-l>", require("smart-splits").resize_right)
set("n", "<C-h>", require("smart-splits").move_cursor_left)
set("n", "<C-j>", require("smart-splits").move_cursor_down)
set("n", "<C-k>", require("smart-splits").move_cursor_up)
set("n", "<C-l>", require("smart-splits").move_cursor_right)
