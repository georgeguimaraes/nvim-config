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
    config = function()
      require("various-textobjs").setup({
        keymaps = {
          useDefaults = true,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = { enable = false },
    },
  },
}
