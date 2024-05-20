return {
  {
    "emmanueltouzery/agitator.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gB",
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
      { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview index" },
    },
    opts = {
      view = {
        merge_tool = {
          layout = 'diff4_mixed'
        }
      }
    }
  },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand("%")
          vim.cmd([[execute "normal! \<ESC>"]])
          local line_start = vim.fn.getpos("'<")[2]
          local line_end = vim.fn.getpos("'>")[2]
          require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
        end,
        desc = "Neogit Log for this range",
        mode = "v",
      },
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand("%")
          require("neogit").action("log", "log_current", { "--", file })()
        end,
        desc = "Neogit Log for this file",
      },
    },
    config = {
      graph_style = "unicode",
      sections = {
        recent = {
          folded = false,
          hidden = false,
        },
      },
      signs = {
        hunk = { "", "" },
        item = { ">", "v" },
        section = { ">", "v" },
      },
    },
  },
  -- {
  --   "pwntester/octo.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("octo").setup()
  --   end,
  -- },
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
  {
    "linrongbin16/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "GitLink",
    keys = {
      { "<leader>gy", "<cmd>GitLink default_branch<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink! default_branch<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
    opts = {},
  },
  {
    "dlvhdr/gh-addressed.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "folke/trouble.nvim",
    },
    cmd = "GhReviewComments",
    keys = {
      { "<leader>gr", "<cmd>GhReviewComments<cr>", desc = "GitHub Review Comments" },
    },
  },
  {
    "dlvhdr/gh-blame.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>gB", "<cmd>GhBlameCurrentLine<cr>", desc = "GitHub PR Blame Current Line" },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
    cmd = "BlameToggle",
    opts = {},
    keys = { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame Toggle" },
  },
}
