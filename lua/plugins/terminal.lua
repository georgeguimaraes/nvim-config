return {
  {
    "letieu/wezterm-move.nvim",
    keys = {
      {
        "<C-h>",
        function()
          require("wezterm-move").move("h")
        end,
        mode = { "n", "t" },
      },
      {
        "<C-j>",
        function()
          require("wezterm-move").move("j")
        end,
        mode = { "n", "t" },
      },
      {
        "<C-k>",
        function()
          require("wezterm-move").move("k")
        end,
        mode = { "n", "t" },
      },
      {
        "<C-l>",
        function()
          require("wezterm-move").move("l")
        end,
        mode = { "n", "t" },
      },
      {
        "<F13>",
        function()
          require("wezterm-move").move("j")
        end,
        mode = { "n", "t" },
        desc = "Navigate down (via Ctrl+J from WezTerm)",
      },
    },
  },
}
