return {
  {
    -- Show indentation lines
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
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
