return {
  { "kosayoda/nvim-lightbulb", config = true },
  {
    "saghen/blink.cmp",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
    },
    opts = {
      sources = {
        default = { "ripgrep" },
        providers = {
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            opts = {
              prefix_min_len = 5,
              context_size = 5,
              max_filesize = "1M",
              additional_rg_options = {},
            },
          },
        },
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_forward", "fallback" },
      },
      completion = {
        menu = {
          draw = {
            padding = { 1, 0 },
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            components = {
              kind_icon = { width = { fill = true } },
            },
          },
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
    },
  },
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
    -- jmp using % to the other end of a treesitter node
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
  {
    "echasnovski/mini.ai",
    opts = {
      mappings = {
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
    opts = {},
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = {
      keymaps = {
        useDefaults = true,
        disabledDefaults = { "iN", "aN", "iy", "ay", "gw", "gW", "!", "io", "ao", "iq", "aq" },
      },
    },
    keys = {
      { "ae", "aw", mode = { "o" } },
      { "ie", "iw", mode = { "o" } },
      { "aw", '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { "o", "x" } },
      { "iw", '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { "o", "x" } },
    },
  },
}
