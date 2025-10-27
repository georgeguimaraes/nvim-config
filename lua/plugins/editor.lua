return {
  -- Bracket navigation for buffers, diagnostics, quickfix, etc.
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    opts = {},
  },

  -- Swiss Army knife plugin providing 33+ mini-plugins
  -- Result: Image preview in buffers, picker with hidden files enabled, truncated file paths
  {
    "folke/snacks.nvim",
    opts = {
      image = {},
      picker = {
        formatters = {
          file = {
            truncate = 50,
          },
        },
        sources = {
          -- Include hidden files (dotfiles) in file picker
          files = { hidden = true },
          explorer = {
            layout = {
              -- Hide input field automatically in explorer layout
              auto_hide = { "input" },
            },
          },
        },
      },
    },
  },

  -- Bookmark/harpoon-like file navigation
  -- Result: ; key toggles arrow menu for quick access to frequently used files
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ";",
    },
  },

  -- Enhanced marks with sign column indicators
  -- Result: Visualizes marks (m[a-z]) in sign column, improved mark management
  {
    "chentoast/marks.nvim",
    opts = {},
  },

  -- Floating window showing filename at top of each buffer
  -- Result: Custom statusline per-window showing file icon, arrow status, and filename
  --         Focused windows highlighted in blue (#6172b0), unfocused in gray (#2f334d)
  {
    "b0o/incline.nvim",
    opts = {
      hide = {
        -- Only show incline when there are multiple windows
        only_win = true,
      },
      window = {
        overlap = {
          -- Allow incline to overlap window borders
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

        -- Color scheme: blue for focused, gray for unfocused
        local bgcol = props.focused and "#6172b0" or "#2f334d"
        local arrow_bg = props.focused and "#6172b0" or "#2f334d"
        ft_color = props.focused and "#6172b0" or "#2f334d"

        local res = {
          {
            -- Layout: [file icon] [arrow status] [filename]
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
