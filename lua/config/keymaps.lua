-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local set = vim.keymap.set

set("n", "<leader>;", "<cmd>e#<cr>", { desc = "Last Buffer" })

set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
set("n", "<leader>wo", "<cmd>only<cr>", { desc = "Focus window" })
set("n", "<leader>wq", "<cmd>q<cr>", { desc = "Quit window" })

local wk = require("which-key")
wk.add({ "<leader>cj", group = "Code Split/Join" })
set("n", "<leader>cjm", "<cmd>TSJToggle<CR>", { desc = "Split/Join code block with autodetect" })
set("n", "<leader>cjj", "<cmd>TSJJoin<CR>", { desc = "Join code block" })
set("n", "<leader>cjs", "<cmd>TSJSplit<CR>", { desc = "Split code block" })

set("n", "[<space>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Empty line above" })
set("n", "]<space>", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Empty line below" })

set("n", "<leader>g0", function()
  local sha = require("agitator").git_blame_commit_for_line()
  local commit_view = require("neogit.buffers.commit_view").new(sha)
  --- @diagnostic disable-next-line: missing-parameter
  commit_view:open()
end, { desc = "Open commit for this line" })

set("n", "<leader>gc", function()
  Snacks.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Commit Log" })

set("v", "<leader>y", function()
  local filetype = vim.bo.filetype

  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

  local command = {
    "highlight",
    "--syntax-by-name=" .. filetype,
    "-O",
    "rtf",
    "--font=VictorMono Nerd Font",
    "--font-size=30",
    "--style=base16/github",
  }
  local cmd = vim.system(command, { stdin = lines, text = true }):wait()

  vim.fn.setreg("+", cmd.stdout)
end, { desc = "Yank as RTF", noremap = true, silent = true })

if vim.fn.executable("lazydocker") == 1 then
  vim.keymap.set("n", "<leader>kk", function()
    Snacks.terminal("lazydocker")
  end, { desc = "Lazydocker" })
end

vim.api.nvim_create_user_command("W", "write", {})

set({ "n", "x" }, "<cr>", function()
  if vim.bo.filetype == "minifiles" then
    return "<cr>"
  end
  vim.lsp.buf.selection_range(vim.v.count1)
end, { desc = "LSP Select Outer", expr = true })

set({ "n", "x" }, "<bs>", function()
  if vim.bo.filetype == "minifiles" then
    return "<bs>"
  end
  vim.lsp.buf.selection_range(-vim.v.count1)
end, { desc = "LSP Select Inner", expr = true })
