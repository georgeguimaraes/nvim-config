return {
  { "Mofiqul/dracula.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = "ordinal",
        separator_style = "slant",
      },
    },
  },
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
    "glepnir/dashboard-nvim",
    opts = function(_, options)
      for _, v in ipairs(options.config.center) do
        if v.key == "e" then
          v.key = "x"
        end
      end
      table.insert(options.config.center, 3, { action = "Neotree", key = "e", desc = "Browse Files", icon = "  " })
      return options
    end,
  },
}
