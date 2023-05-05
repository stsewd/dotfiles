-- Themes & color schemes
return {
  "nvim-tree/nvim-web-devicons",
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
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

      if vim.env.BACKGROUND ~= "light" then
        vim.cmd("colorscheme tokyonight")
      end
    end,
  },
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      if vim.env.BACKGROUND == "light" then
        vim.cmd("colorscheme solarized")
      end
    end,
  },
}
