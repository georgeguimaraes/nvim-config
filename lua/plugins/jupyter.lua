return {
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "wezterm"
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { "<leader>ji", "<cmd>MoltenInit<cr>", desc = "Initialize the plugin" },
      { "<leader>je", "<cmd>MoltenEvaluateOperator<cr>", desc = "run operator selection" },
      { "<leader>jl", "<cmd>MoltenEvaluateLine<cr>", desc = "evaluate line" },
      { "<leader>jr", "<cmd>MoltenReevaluateCell<cr>", desc = "re-evaluate cell" },
      { "<leader>jd", "<cmd>MoltenDelete<cr>", desc = "molten delete cell" },
      { "<leader>jh", "<cmd>MoltenHideOutput<cr>", desc = "hide output" },
      { "<leader>js", "<cmd>noautocmd MoltenEnterOutput<cr>", desc = "show/enter output" },
      { "<leader>jr", "<cmd>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "evaluate visual selection" },
    },
  },
  {
    "willothy/wezterm.nvim",
    opts = {},
  },
}
