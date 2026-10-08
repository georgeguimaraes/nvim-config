-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local set = vim.keymap.set

set("n", "<leader>;", "<cmd>e#<cr>", { desc = "Last Buffer" })

set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
set("n", "<leader>wo", "<cmd>only<cr>", { desc = "Focus window" })
set("n", "<leader>wq", "<cmd>q<cr>", { desc = "Quit window" })

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
  -- In terminal buffers, Enter goes to insert mode and sends Enter
  if vim.bo.buftype == "terminal" then
    return "i<cr>"
  end
  return vim.fn.mode() == "n" and "v<Plug>(select-outer)" or "<Plug>(select-outer)"
end, { desc = "Select Outer Node", expr = true, remap = true })

-- same as the native an/in (0.12)
local function select_node(count)
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    local select = require("vim.treesitter._select")
    if count > 0 then
      select.select_parent(count)
    else
      select.select_child(-count)
    end
  else
    vim.lsp.buf.selection_range(count)
  end
end

-- selections <cr> expanded from, so <bs> can walk back to the exact original selection
local selection_stack = {}

local function get_selection()
  return {
    buf = vim.api.nvim_get_current_buf(),
    tick = vim.b.changedtick,
    mode = vim.fn.mode(),
    from = vim.fn.getpos("v"),
    to = vim.fn.getpos("."),
  }
end

local function same_selection(a, b)
  return a.buf == b.buf and a.tick == b.tick and a.mode == b.mode and vim.deep_equal(a.from, b.from) and vim.deep_equal(a.to, b.to)
end

set("x", "<Plug>(select-outer)", function()
  local before = get_selection()
  local top = selection_stack[#selection_stack]
  if not (top and same_selection(top.after, before)) then
    selection_stack = {}
  end
  select_node(vim.v.count1)
  local after = get_selection()
  if not same_selection(before, after) then
    table.insert(selection_stack, { before = before, after = after })
  end
end)

local function restore_selection(sel)
  vim.cmd("normal! \27")
  vim.fn.setpos(".", sel.from)
  vim.cmd("normal! " .. sel.mode)
  vim.fn.setpos(".", sel.to)
end

local function selection_bounds(sel)
  local a, b = { sel.from[2], sel.from[3] }, { sel.to[2], sel.to[3] }
  if a[1] > b[1] or (a[1] == b[1] and a[2] > b[2]) then
    return b, a
  end
  return a, b
end

local function pos_lt(a, b)
  return a[1] < b[1] or (a[1] == b[1] and a[2] < b[2])
end

set("x", "<bs>", function()
  local current = get_selection()
  local top = selection_stack[#selection_stack]
  if not (top and same_selection(top.after, current)) then
    selection_stack = {}
    select_node(-vim.v.count1)
    -- the native child selection grows when the selection is smaller than a node
    local s1, e1 = selection_bounds(current)
    local s2, e2 = selection_bounds(get_selection())
    if pos_lt(s2, s1) or pos_lt(e1, e2) then
      restore_selection(current)
    end
    return
  end
  for _ = 2, math.min(vim.v.count1, #selection_stack) do
    table.remove(selection_stack)
  end
  restore_selection(table.remove(selection_stack).before)
end, { desc = "Select Inner Node" })

-- Toggle maximize window in terminal mode (via Ctrl+M from WezTerm sending F14)
set("t", "<F14>", "<C-q><leader>wmi", { desc = "Toggle maximize window", noremap = true })
