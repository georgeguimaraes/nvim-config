---@diagnostic disable: undefined-global
function M.wezterm()
  local nav = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
  }

  local function navigate(dir)
    return function()
      local win = vim.api.nvim_get_current_win()
      vim.cmd.wincmd(dir)
      local pane = vim.env.WEZTERM_PANE
      if vim.system and pane and win == vim.api.nvim_get_current_win() then
        local pane_dir = nav[dir]
        vim.system({ "wezterm", "cli", "activate-pane-direction", pane_dir }, { text = true }, function(p)
          if p.code ~= 0 then
            vim.notify(
              "Failed to move to pane " .. pane_dir .. "\n" .. p.stderr,
              vim.log.levels.ERROR,
              { title = "Wezterm" }
            )
          end
        end)
      end
    end
  end

  -- Move to window using the movement keys
  for key, dir in pairs(nav) do
    vim.keymap.set("n", "<C-" .. key .. ">", navigate(key), { desc = "Go to " .. dir .. " window" })
  end
end

return M
