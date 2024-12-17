return {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  -- I'm using my own mappings now.
  -- {"tpope/vim-unimpaired"},
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
    keys = { { "S" }, { "s" } },
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
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Disable some plugins when opening a big file.
      bigfile = { enabled = true },
      -- vim.notify implementation.
      notifier = { enabled = true },
      -- Load content as quickly as possible when opening a single file.
      quickfile = { enabled = true },
      -- Show fold/marks markers.
      -- Takes too much space, I don't think I need it anyway
      -- statuscolumn = {
      --   enabled = false,
      --   left = {"sign", "mark", "git" },
      --   right = { "fold" },
      -- },
      styles = {
        notification = {
          -- wo = {winblend = 10},
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Create toggle mappings
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("spell", { name = "Spell" }):map("<leader>us")
          Snacks.toggle.diagnostics():map("<leader>ud")

          -- Add a :Notifications command to show the notifications history.
          vim.cmd("command! Notifications lua Snacks.notifier.show_history()")
        end,
      })
    end,
  },
}
