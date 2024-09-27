return {
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    requires = { "nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        join = {
          space_in_brackets = true,
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local bordered = {
        border = "rounded",
        winhighlight = "FloatBorder:IndentBlanklineChar,Normal:Normal",
        zindex = 1001,
        scrolloff = 0,
        col_offset = 0,
        side_padding = 1,
        scrollbar = true,
      }
      opts.window = {
        completion = bordered,
        documentation = bordered,
      }

      opts.view = {
        entries = {
          follow_cursor = true,
        },
      }
    end,
  },
  {
    "Wansmer/sibling-swap.nvim",
    dependencies = { "nvim-treesitter" },
    event = "VeryLazy",
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      {
        "<C-.>",
        function(_)
          require("sibling-swap").swap_with_right_with_opp()
        end,
      },
      {
        "<C-,>",
        function(_)
          require("sibling-swap").swap_with_left_with_opp()()
        end,
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "rgroli/other.nvim",
    event = "VeryLazy",
    main = "other-nvim",
    opts = {
      mappings = {
        "rails",
      },
    },
    keys = {
      {
        "<leader>co",
        "<cmd>:Other<CR>",
        desc = "Other file",
      },
    },
  },
  {
    -- jump using % to the other end of a treesitter node
    "yorickpeterse/nvim-tree-pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.align",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
}
