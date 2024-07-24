return {
  {
    "sustech-data/wildfire.nvim",
    event = "LazyFile",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      {
        surrounds = {
          { "(", ")" },
          { "{", "}" },
          { "<", ">" },
          { "[", "]" },
        },
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
        filetype_exclude = { "qf", "neotree" }, --keymaps will be unset in excluding filetypes
      },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
  {
    "nvim-treesitter/playground",
    config = function() end,
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    config = function() end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/playground" },
    opts = {
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      incremental_selection = { enable = false },
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["."] = { "textsubjects-smart", desc = "Select smart (text subject)" },
          [";"] = { "textsubjects-container-outer", desc = "Select outer containers (text subject)" },
          ["i;"] = { "textsubjects-container-inner", desc = "Select inside containers (text subject)" },
        },
      },
    },
  },
}
