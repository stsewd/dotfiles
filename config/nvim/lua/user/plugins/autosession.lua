return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_create = false,
      })
    end,
  },
}
