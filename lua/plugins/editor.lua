return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "", -- this can only be used in the git_status source
            renamed = "", -- this can only be used in the git_status source
            -- Status type
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
      },
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
