return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code: Open Terminal" },
    {
      "<leader>aC",
      "<cmd>ClaudeCodeResume<cr>",
      desc = "Claude Code: Resume",
    },
  },
  opts = {
    command = "/Users/george/.claude/local/claude",
    window = {
      position = "vertical botright",
      split_ratio = 0.4,
    },
    keymaps = {
      toggle = {
        normal = "<C-,>", -- Normal mode keymap for toggling Claude Code, false to disable
        terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code, false to disable
        variants = {
          continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
          verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
        },
      },
      window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
      scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
    },
  },
}
