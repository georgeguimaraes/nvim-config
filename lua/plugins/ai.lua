return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     filetypes = {
  --       markdown = true,
  --       help = true,
  --       gitcommit = true,
  --       gitrebase = true,
  --       yaml = true,
  --     },
  --   },
  -- },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      chat = "anthropic",
      inline = "anthropic",
      agent = "anthropic",
    },
  },
}
