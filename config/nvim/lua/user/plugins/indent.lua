local map = vim.keymap.set
return {
  {
    -- Show indentation lines
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        char = "¦",
        filetype_exclude = { "help", "man", "", "text", "tsplayground", "rst", "markdown", "checkhealth" },
        show_trailing_blankline_indent = false,
      })

      -- Workaround for https://github.com/lukas-reineke/indent-blankline.nvim/issues/449.
      map("n", "za", "za<cmd>IndentBlanklineRefresh<CR>")
      map("n", "zR", "zR<cmd>IndentBlanklineRefresh<CR>")
    end,
  },
}
