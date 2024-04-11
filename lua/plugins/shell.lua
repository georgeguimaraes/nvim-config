return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        shfmt = {
          args = { "-i", "2" },
        },
      },
    },
  },
}
