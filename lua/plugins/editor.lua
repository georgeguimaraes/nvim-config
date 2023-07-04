return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = false,
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
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function()
      require("telescope").load_extension("fzy_native")
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      detection_methods = { "pattern" },
    },
  },
}
