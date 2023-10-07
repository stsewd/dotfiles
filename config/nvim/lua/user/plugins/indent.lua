local map = vim.keymap.set
return {
  {
    -- Show indentation lines
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = { "help", "man", "text", "rst", "markdown", "checkhealth" },
        },
        indent = {
          char = "▏",
          -- char = "¦",
        },
        scope = {
          enabled = false,
        },
      })

      -- Workaround for https://github.com/lukas-reineke/indent-blankline.nvim/issues/449.
      -- map("n", "za", "za<cmd>IndentBlanklineRefresh<CR>")
      -- map("n", "zR", "zR<cmd>IndentBlanklineRefresh<CR>")
    end,
  },
}
