return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    -- make sure to load this before other plugins.
    priority = 1000,
    cond = function()
      return vim.env.BACKGROUND ~= "light"
    end,
    config = function()
      require("tokyonight").setup({
        styles = { comments = { italic = false } },
      })

      vim.cmd("colorscheme tokyonight-storm")
    end,
  },
  {
    "ishan9299/nvim-solarized-lua",
    -- make sure to load this before other plugins.
    priority = 1000,
    cond = function()
      return vim.env.BACKGROUND == "light"
    end,
    config = function()
      vim.cmd("colorscheme solarized")
    end,
  },
}
