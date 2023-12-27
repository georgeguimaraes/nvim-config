return {
  {
    "2kabhishek/co-author.nvim",
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gd", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview index" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gl", "<cmd>Neogit kind=log<cr>", desc = "Neogit log" },
    },
  },
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "petertriho/cmp-git",
        config = function()
          require("cmp_git").setup()
        end,
      },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "git" },
      }))
    end,
  },
}
