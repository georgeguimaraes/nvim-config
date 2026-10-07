return {
  -- Hex.pm completions for mix.exs (package names, versions, options)
  {
    "saghen/blink.cmp",
    dependencies = { "dbernheisel/hex-cmp" },
    opts = {
      sources = {
        per_filetype = {
          elixir = { inherit_defaults = true, "hex" },
        },
        providers = {
          hex = { name = "hex", module = "hex_cmp", async = true },
        },
      },
    },
  },
  {
    "nvim-mini/mini.icons",
    opts = function(_)
      vim.cmd([[highlight MiniIconsPurple guifg=#9660EE]])
    end,
  },
  -- Replace elixir-ls with dexter in mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "elixir-ls"
      end, opts.ensure_installed or {})
      table.insert(opts.ensure_installed, "dexter")
    end,
  },
  -- Disable elixirls and expert, enable dexter
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = { enabled = false },
        expert = { enabled = false },
        -- dexter uses its cwd as the project root (and for asdf stdlib detection), not rootUri
        dexter = {
          cmd = function(dispatchers, config)
            return vim.lsp.rpc.start({ "dexter", "lsp" }, dispatchers, { cwd = config.root_dir })
          end,
        },
      },
    },
  },
}
