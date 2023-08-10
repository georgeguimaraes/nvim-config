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
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      table.insert(dashboard.section.buttons.val, 3, dashboard.button("e", " " .. " Browse files", ":Neotree<CR>"))
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {}, -- Disable time from LazyVim
      },
    },
  },
}
