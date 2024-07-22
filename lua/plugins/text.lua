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
        -- ["*"] = { "codespell" },
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
        "vale-ls",
        "harper-ls",
      })
    end,
  },
  {
    "jmbuhr/otter.nvim",
    event = "BufEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      buffers = {
        set_filetype = true,
      },
      verbose = {
        no_code_found = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              userDictPath = "~/.config/harper/dict.txt",
              codeActions = {
                forceStable = true,
              },
              linters = {
                spell_check = true,
                spelled_numbers = false,
                an_a = true,
                sentence_capitalization = true,
                unclosed_quotes = true,
                wrong_quotes = false,
                long_sentences = true,
                repeated_words = true,
                spaces = true,
                matcher = true,
                correct_number_suffix = true,
                number_suffix_capitalization = true,
                multiple_sequential_pronouns = true,
              },
            },
          },
        },
      },
    },
  },
}
