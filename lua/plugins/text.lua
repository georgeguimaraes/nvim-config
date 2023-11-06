return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ["*"] = { "codespell" },
        markdown = { "markdownlint" },
      },
      linters = {
        codespell = {
          cmd = "codespell",
          args = { "--ignore-words", "~/.config/codespell/ignore-words.txt" },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ltex-ls", -- needs brew install openjdk
        "vale-ls",
      })
    end,
  },
  {
    "jmbuhr/otter.nvim",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
  },
}
