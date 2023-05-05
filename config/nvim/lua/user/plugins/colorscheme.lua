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
        styles = { comments = "None" },
        sidebars = { "qf" },
        on_highlights = function(hl, c)
          hl["@punctuation.special.rst"] = { fg = c.orange, style = "bold" }

          hl.FzfLuaNormal = { fg = c.fg_dark, bg = c.bg_dark }
          hl.FzfLuaBorder = { fg = c.bg_search, bg = c.bg_dark }
          hl.FzfLuaCurrentLine = { fg = c.fg_dark, bg = c.bg_search }
        end,
      })

      vim.cmd("colorscheme tokyonight")
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
