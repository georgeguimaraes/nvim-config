return {
  {
    "MeanderingProgrammer/markdown.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.file_types, { "livebook" })
    end,
  },
}
