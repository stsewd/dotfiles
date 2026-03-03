local map = vim.keymap.set

return {
  "kylechui/nvim-surround",
  -- TODO: are we using this?
  "tpope/vim-repeat",
  {
    -- Handy bracket mappings
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        map_c_h = true,
        map_cr = false,
        -- Disable autopairs when using Snacks' picker
        disable_filetype = { "snacks_picker_input" },
      })
    end,
  },
  "chaoren/vim-wordmotion",
  -- Operator pending mappings ()[]{}
  "wellle/targets.vim",
  {
    -- Jump to any character in the buffer
    "https://codeberg.org/andyg/leap.nvim",
    keys = { { "S" }, { "s" } },
    config = function()
      map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    end,
  },
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },
  {
    "stsewd/sphinx.nvim",
    build = ":UpdateRemotePlugins",
  },
}
