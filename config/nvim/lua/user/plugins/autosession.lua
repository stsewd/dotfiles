return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_create_enabled = false,
      })
    end,
  },
}
