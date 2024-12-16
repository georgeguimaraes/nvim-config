return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionToggle", "CodeCompanionAdd", "CodeCompanionChat" },

    opts = function()
      local options = require("codecompanion.config")
      local user = vim.env.USER or "User"

      options.strategies.chat.roles = {
        llm = "  CodeCompanion",
        user = "  " .. user,
      }

      options.strategies.chat.keymaps.close.modes = {
        n = "q",
        i = "<Esc>",
      }
      options.strategies.chat.keymaps.stop.modes.n = "<Esc>"
      options.strategies.chat.keymaps.send.modes.n = "<CR>"

      return options
    end,

    keys = {
      { "<leader>A", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>Ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Prompt Actions (CodeCompanion)" },
      { "<leader>Ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle (CodeCompanion)" },
      { "<leader>Ac", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add code to CodeCompanion" },
      { "<leader>Ai", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline prompt (CodeCompanion)" },
    },
  },

  -- Edgy integration
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "codecompanion",
        title = "CodeCompanion Chat",
        size = { width = 50 },
      })
    end,
  },
}
