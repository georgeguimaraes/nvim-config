return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- sources = { "filesystem" },
      window = {
        width = 40,
      },
      -- enable_diagnostics = false,
      -- enable_opened_markers = false,
      log_level = "trace",
      log_to_file = "/tmp/neotree.lazyvim.log",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { ".git" },
        },
      },
    },
  },
}
