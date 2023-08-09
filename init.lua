-- vim.g.neovim_node_host_prog = vim.fn.trim(vim.fn.system("asdf where nodejs 19.6.0")) .. "/bin/node"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
