local map = vim.keymap.set
return {
  -- General utilities
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_create_enabled = false,
      })
    end,
  },
  {
    dir = "~/github/spotify.nvim",
    build = ":UpdateRemotePlugins",
    cmd = "Spotify",
    init = function()
      map("n", "<leader>ss", ":Spotify play/pause<CR>", { silent = true })
      map("n", "<leader>sj", ":Spotify next<CR>", { silent = true })
      map("n", "<leader>sk", ":Spotify prev<CR>", { silent = true })
      map("n", "<leader>so", ":Spotify show<CR>", { silent = true })
      map("n", "<leader>sc", ":Spotify status<CR>", { silent = true })
    end,
    config = function()
      local spotify = require("spotify")
      spotify.setup({ timeout = 5000 })
    end,
  },

  -- Editor utilities
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
  "tpope/vim-surround",
  "tpope/vim-commentary",
  {
    -- Handy bracket mappings
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        map_c_h = true,
        map_cr = false,
      })
    end,
  },
  "tpope/vim-unimpaired",
  "tpope/vim-repeat",
  {
    -- Close/hide/delete current buffer.
    "mhinz/vim-sayonara",
    cmd = "Sayonara",
    init = function()
      map("n", "<leader>q", ":Sayonara<CR>", { silent = true })
      map("n", "<leader>Q", ":Sayonara!<CR>", { silent = true })
    end,
  },

  -- Navigation
  "stsewd/gx-extended.vim",

  -- Text objects & motions
  "chaoren/vim-wordmotion",
  "wellle/targets.vim", -- Operator pending mappings ()[]{}
  {
    -- Jump to any character in the buffer
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
      require("leap").opts.case_sensitive = true
    end,
  },

  -- Additional support for languages
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },
  {
    "stsewd/sphinx.nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      map("n", "<leader>ft", ":FzSphinxFiles<CR>", { silent = true })
    end,
  },
}
