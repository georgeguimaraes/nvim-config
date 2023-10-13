return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = false,
        },
      },
      sources = { "filesystem", "buffers", "git_status" },
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
  -- {
  --   "ahmedkhalf/project.nvim",
  --   opts = {
  --     detection_methods = { "pattern" },
  --   },
  -- },
}
