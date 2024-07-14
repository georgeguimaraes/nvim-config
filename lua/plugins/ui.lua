return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {}, -- Disable time from LazyVim
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, options)
      for _, v in ipairs(options.config.center) do
        if v.key == "g" then
          v.key = "/"
          v.action = "Telescope live_grep_args"
        end
      end
      table.insert(
        options.config.center,
        3,
        { action = "Neotree", key = "e", key_format = "  %s", desc = "Browse Files", icon = "  " }
      )
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },
}
