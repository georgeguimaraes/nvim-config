return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {
          autoformat = true,
          completion = true,
          diagnostic = true,
          folding = true,
          references = true,
          rename = true,
          symbols = true,
        },
      },
    },
  },
}
