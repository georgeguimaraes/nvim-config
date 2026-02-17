return {
  {
    "nvim-mini/mini.diff",
    keys = {
      {
        "<leader>gha",
        function()
          return require("mini.diff").operator("apply") .. "gh"
        end,
        expr = true,
        desc = "Stage hunk",
      },
      {
        "<leader>ghr",
        function()
          return require("mini.diff").operator("reset") .. "gh"
        end,
        expr = true,
        desc = "Reset hunk",
      },
    },
  },
  {
    "emmanueltouzery/agitator.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    keys = {
      {
        "<leader>gw",
        function()
          require("agitator").git_blame_toggle()
        end,
        desc = "Git Blame Panel",
      },
      {
        "<leader>gO",
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
    "esmuellert/codediff.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gx", "<cmd>CodeDiff<cr>", desc = "CodeDiff (all changes)" },
      {
        "<leader>gD",
        function()
          -- Always diff against main/master (for pre-PR review)
          local has_main = vim.fn.system("git rev-parse --verify origin/main 2>/dev/null"):gsub("%s+", "")
          local base = has_main ~= "" and "origin/main" or "origin/master"
          vim.cmd("CodeDiff ref " .. base .. " HEAD")
        end,
        desc = "Diff branch vs main/master",
      },
      {
        "<leader>gd",
        function()
          -- Diff against upstream/parent (for stacked PRs)
          local result = vim.fn.system("git rev-parse --abbrev-ref @{upstream} 2>&1")
          local base = vim.trim(result)
          if base == "" or base:match("fatal") or base:match("no upstream") then
            vim.notify("No upstream branch set. Use <leader>gD to diff against main.", vim.log.levels.WARN)
            return
          end
          vim.cmd("CodeDiff ref " .. base .. " HEAD")
        end,
        desc = "Diff branch vs upstream/parent",
      },
    },
    config = function()
      require("codediff").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "esmuellert/codediff.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
      {
        "<leader>gv",
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
        "<leader>gv",
        function()
          local file = vim.fn.expand("%")
          require("neogit").action("log", "log_current", { "--", file })()
        end,
        desc = "Neogit Log for this file",
      },
    },
    config = {
      diff_viewer = "codediff",
      graph_style = "unicode",
      sections = {
        recent = {
          folded = false,
          hidden = false,
        },
      },
    },
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
      { "<leader>gR", "<cmd>GhReviewComments<cr>", desc = "GitHub Review Comments" },
    },
  },
  {
    "dlvhdr/gh-blame.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>gW", "<cmd>GhBlameCurrentLine<cr>", desc = "GitHub PR Blame Current Line" },
    },
  },
  {
    "pwntester/octo.nvim",
    opts = {
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },
}
