local util = require("lspconfig.util")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          root_dir = function(fname)
            return util.find_git_ancestor(fname) or util.root_pattern("mix.exs")(fname) or vim.loop.os_homedir()
          end,
        },
      },
    },
  },
}
