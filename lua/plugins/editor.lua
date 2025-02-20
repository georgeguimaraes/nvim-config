return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {},
      picker = {
        formatters = {
          file = {
            truncate = 70,
          },
        },
        sources = {
          files = { hidden = true },
          explorer = {
            layout = {
              auto_hide = { "input" },
            },
          },
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
  {
    "chentoast/marks.nvim",
    opts = {},
  },

  {
    "b0o/incline.nvim",
    opts = {
      hide = {
        only_win = true,
      },
      window = {
        overlap = {
          borders = true,
        },
        padding = 0,
        margin = {
          vertical = 0,
          horizontal = 0,
        },
      },
      render = function(props)
        local devicons = require("nvim-web-devicons")
        local helpers = require("incline.helpers")
        local arrow = require("arrow.statusline")

        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local arrow_status = arrow.text_for_statusline_with_icons(props.buf)

        local bgcol = props.focused and "#6172b0" or "#2f334d"
        local arrow_bg = props.focused and "#6172b0" or "#2f334d"
        ft_color = props.focused and "#6172b0" or "#2f334d"

        local res = {
          {
            ft_icon and { ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            { arrow_status, guibg = arrow_bg, guifg = helpers.contrast_color(arrow_bg) },
            { " ", filename, gui = modified and "italic" or "" },
            guibg = bgcol,
            guifg = helpers.contrast_color(bgcol),
          },
        }
        return res
      end,
    },
    event = "VeryLazy",
  },
}
