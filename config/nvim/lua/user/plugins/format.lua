local map = vim.keymap.set
return {
  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    keys = { "<leader>cf" },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          javascript = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          bash = { "shfmt" },
          sh = { "shfmt" },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
      })

      map("", "<leader>cf", function()
        if require("conform").format() then
          vim.notify("File formatted")
        else
          vim.notify("No formatter found")
        end
      end, { desc = "Format current file" })
    end,
  },
}
