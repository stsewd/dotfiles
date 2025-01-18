return {
  {
    "folke/tokyonight.nvim",
    -- Make sure to load this before other plugins.
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        styles = { comments = { italic = false } },
      })

      vim.cmd("colorscheme tokyonight-storm")
    end,
  },
  {
    "maxmx03/solarized.nvim",
    -- Make sure to load this before other plugins.
    priority = 1000,
    config = function()
      require("solarized").setup({
        variant = "autumn",
      })
      -- vim.cmd("colorscheme solarized")
    end,
  },
}
