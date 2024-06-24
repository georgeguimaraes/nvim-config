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
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    opts = function(_, opts)
      opts.strategies = {
        chat = "anthropic",
        inline = "anthropic",
        tools = "anthropic",
      }
      opts.adapters = {
        anthropic = require("codecompanion.adapters").use("anthropic", {
          schema = {
            model = {
              default = "claude-3-5-sonnet-20240620",
            },
          },
        }),
      }
    end,
    keys = {
      { "<leader>Aa", "<cmd>CodeCompanionActions<cr>", mode = "n", noremap = true, silent = true },
      { "<leader>Aa", "<cmd>CodeCompanionActions<cr>", mode = "v", noremap = true, silent = true },
      { "<leader>AA", "<cmd>CodeCompanionToggle<cr>", mode = "n", noremap = true, silent = true },
      { "<leader>AA", "<cmd>CodeCompanionToggle<cr>", mode = "v", noremap = true, silent = true },
      { "<leader>A", "<cmd>CodeCompanionAdd<cr>", mode = "v", noremap = true, silent = true },
    },
  },
}
