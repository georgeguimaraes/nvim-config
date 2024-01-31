return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = false,
    branch = "main",
    -- dev = true,
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = false,
        },
      },
      -- sources = { "filesystem" },
      window = {
        width = 40,
      },
      -- enable_diagnostics = false,
      -- enable_opened_markers = false,
      log_level = "debug",
      log_to_file = "/tmp/neotree.lazyvim.log",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { ".git/" },
        },
      },
    },
  },
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ";", -- Recommended to be a single key
    },
  },
}
