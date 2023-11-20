local map = vim.keymap.set
return {
  -- Say goodbye to surround?
  -- "tpope/vim-surround",
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  "tpope/vim-commentary",
  "tpope/vim-unimpaired",
  "tpope/vim-repeat",
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
  "chaoren/vim-wordmotion",
  -- Operator pending mappings ()[]{}
  "wellle/targets.vim",
  {
    -- Jump to any character in the buffer
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
      require("leap").opts.case_sensitive = true
    end,
  },
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
