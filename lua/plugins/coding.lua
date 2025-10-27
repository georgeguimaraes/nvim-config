return {
  -- Shows lightbulb in sign column when code actions are available
  { "kosayoda/nvim-lightbulb", config = true },

  -- Completion menu appearance
  -- Result: Rounded borders, custom padding, kind icons aligned to the right
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          draw = {
            -- Vertical padding only, no horizontal padding
            padding = { 1, 0 },
            -- Layout: [label + description] [icon + kind]
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            components = {
              -- Kind icon column fills available space, pushing content right
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

  -- Split/join code blocks (arrays, objects, function params, etc.)
  -- Result: <leader>cjm toggles, <leader>cjj joins, <leader>cjs splits
  {
    "Wansmer/treesj",
    requires = { "nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      join = {
        space_in_brackets = true,
      },
    },
    keys = {
      { "<leader>cjm", "<cmd>TSJToggle<CR>", desc = "Split/Join code block" },
      { "<leader>cjj", "<cmd>TSJJoin<CR>", desc = "Join code block" },
      { "<leader>cjs", "<cmd>TSJSplit<CR>", desc = "Split code block" },
    },
  },

  -- Swap function arguments, array elements, etc. using treesitter
  -- Result: Alt-. swaps right, Alt-, swaps left (with opposite sibling intelligence)
  {
    "Wansmer/sibling-swap.nvim",
    dependencies = { "nvim-treesitter" },
    event = "VeryLazy",
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      {
        "<M-.>",
        function(_)
          require("sibling-swap").swap_with_right_with_opp()
        end,
      },
      {
        "<M-,>",
        function(_)
          require("sibling-swap").swap_with_left_with_opp()()
        end,
      },
    },
  },

  -- LSP rename with live preview across all buffers
  -- Result: See changes in real-time before confirming rename
  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Navigate to related files (controller ↔ view ↔ test)
  -- Result: <leader>co opens related file picker for Rails projects
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

  -- Jump using % to matching treesitter nodes (if/end, def/end, etc.)
  -- Result: % works on language constructs, not just brackets
  {
    "yorickpeterse/nvim-tree-pairs",
    event = "VeryLazy",
    opts = {},
  },

  -- Text alignment operator
  -- Result: ga operator aligns text (e.g., gaip= aligns on =)
  {
    "nvim-mini/mini.align",
    version = false,
    event = "VeryLazy",
    opts = {},
  },

  -- Enhanced text objects (function args, quotes, brackets, etc.)
  -- Result: Disables next/last navigation (an, in, al, il) to avoid conflicts
  {
    "nvim-mini/mini.ai",
    opts = {
      mappings = {
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
      },
    },
  },

  -- Smarter word motions that respect camelCase and snake_case
  -- Result: w/b/e skip subwords (camelCase → next word, not next capital)
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

  -- Additional text objects (indentation, keys, values, numbers, etc.)
  -- Result: Custom mappings - aw/iw for subwords, ae/ie fallback to word motions
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = {
      keymaps = {
        useDefaults = true,
        -- Disable conflicting defaults
        disabledDefaults = { "iN", "aN", "iy", "ay", "gw", "gW", "!", "io", "ao", "iq", "aq" },
      },
    },
    keys = {
      -- Fallback to word motions in operator-pending
      { "ae", "aw", mode = { "o" } },
      { "ie", "iw", mode = { "o" } },
      -- Override aw/iw to work on subwords (camelCase/snake_case parts)
      { "aw", '<cmd>lua require("various-textobjs").subword("outer")<CR>', mode = { "o", "x" } },
      { "iw", '<cmd>lua require("various-textobjs").subword("inner")<CR>', mode = { "o", "x" } },
    },
  },
}
