return {
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["kubernetes"] = "/k8s/*.yaml",
              },
            },
          },
        },
      },
    },
  },
}
