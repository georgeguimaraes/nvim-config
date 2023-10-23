return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ["*"] = { "codespell" },
        markdown = { "markdownlint", "vale" },
        tex = { "vale" },
        asciidoc = { "vale" },
      },
    },
  },
}
