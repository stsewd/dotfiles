return {
  {
    "williamboman/mason.nvim",
    build = function()
      vim.cmd.MasonUpdate()
    end,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "lua_ls",
          "jsonls",
          "yamlls",
          "html",
          "cssls",
          "tsserver",
          "esbonio",
          "clangd",
          "rust_analyzer",
        },
      })
    end,
  },
}
