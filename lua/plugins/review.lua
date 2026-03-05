return {
  {
    dir = "~/code/nvim-plugins/review.nvim",
    dependencies = {
      "esmuellert/codediff.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Review" },
    keys = {
      { "<leader>rr", "<cmd>Review<cr>", desc = "Review" },
      { "<leader>rc", "<cmd>Review commits<cr>", desc = "Review commits" },
    },
    opts = {},
  },
}
