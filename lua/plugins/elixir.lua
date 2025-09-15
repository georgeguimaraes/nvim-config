return {
  {
    "nvim-mini/mini.icons",
    opts = function(_)
      vim.cmd([[highlight MiniIconsPurple guifg=#9660EE]])
    end,
  },
  {
    "synic/refactorex.nvim",
    ft = "elixir",
    opts = {
      auto_update = true,
      pin_version = nil,
    },
  },
}
