return {
  {
    "nvim-mini/mini.icons",
    opts = function(_)
      vim.cmd([[highlight MiniIconsPurple guifg=#9660EE]])
    end,
  },
  -- Replace elixir-ls with expert in mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "elixir-ls"
      end, opts.ensure_installed or {})
      table.insert(opts.ensure_installed, "expert")
    end,
  },
  -- Disable elixirls, enable expert
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = { enabled = false },
        expert = {},
      },
    },
  },
}
