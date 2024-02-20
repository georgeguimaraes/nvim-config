return {
  {
    "emmanueltouzery/agitator.nvim",
    opts = {},
    keys = {
      {
        "<leader>gb",
        function()
          require("agitator").git_blame_toggle()
        end,
        desc = "Git Blame",
      },
      {
        "<leader>gf",
        function()
          require("agitator").open_file_git_branch()
        end,
        desc = "Open file from another branch",
      },
      {
        "<leader>g/",
        function()
          require("agitator").search_git_branch()
        end,
        desc = "Search text in another branch",
      },
      {
        "<leader>gt",
        function()
          require("agitator").git_time_machine()
        end,
        desc = "Time Machine for this file",
      },
      {
        "<leader>go",
        function()
          local sha = require("agitator").git_blame_commit_for_line()
          vim.cmd("DiffviewOpen " .. sha .. "^.." .. sha)
        end,
        desc = "Open commit for this line",
      },
    },
  },
  {
    "2kabhishek/co-author.nvim",
    event = "VeryLazy",
    keys = { "<leader>ga", "<cmd>GitCoAuthors<cr>", desc = "Add Co-Authors" },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gL", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview index" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gl", "<cmd>Neogit kind=log<cr>", desc = "Neogit log" },
    },
    config = {
      graph_style = "unicode",
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
    opts = {},
    keys = { "<leader>go", "<cmd>Octo<cr>", desc = "Octo" },
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
