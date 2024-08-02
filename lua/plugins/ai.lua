return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        yaml = true,
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
    },
    opts = {
      chat = "anthropic",
      inline = "anthropic",
      agent = "anthropic",
    },
    keys = {
      { "<leader>A", "", desc = "+AI", mode = { "n", "v" } },
      { "<leader>Aa", "<cmd>CodeCompanionActions<cr>", mode = "n", desc = "Actions" },
      { "<leader>Aa", "<cmd>CodeCompanionActions<cr>", mode = "v", desc = "Actions" },
      { "<leader>AA", "<cmd>CodeCompanionToggle<cr>", mode = "n", desc = "Toggle Panel" },
      { "<leader>AA", "<cmd>CodeCompanionToggle<cr>", mode = "v", desc = "Toggle Panel" },
      { "<leader>As", "<cmd>CodeCompanionAdd<cr>", mode = "v", desc = "Add code to CodeCompanion" },
    },
  },
}
