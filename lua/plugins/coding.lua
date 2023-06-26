return {
  {
    "RRethy/nvim-treesitter-endwise",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "mizlan/iswap.nvim",
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    config = function()
      local autopairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      autopairs.setup()

      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
      autopairs.add_rules({
        Rule(" ", " "):with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end),
      })
      for _, bracket in pairs(brackets) do
        autopairs.add_rules({
          Rule(bracket[1] .. " ", " " .. bracket[2])
            :with_pair(function()
              return false
            end)
            :with_move(function(opts)
              return opts.prev_char:match(".%" .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2]),
        })
      end
    end,
  },
  {
    "Wansmer/treesj",
    requires = { "nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        join = {
          space_in_brackets = true,
        },
      })
    end,
  },
  {
    "echasnovski/mini.bracketed",
    version = false,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.move",
    version = false,
    lazy = true,
  },
  {
    "HampusHauffman/block.nvim",
    config = function()
      require("block").setup({})
    end,
  },
}
