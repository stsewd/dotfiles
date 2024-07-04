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
        },
        scope = {
          enabled = false,
        },
      })
    end,
  },
}
