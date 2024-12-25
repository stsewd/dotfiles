local map = vim.keymap.set
return {
  {
    "stsewd/spotify.nvim",
    build = ":UpdateRemotePlugins",
    cmd = "Spotify",
    init = function()
      map("n", "<leader>ss", ":Spotify play/pause<CR>", { silent = true })
      map("n", "<leader>sj", ":Spotify next<CR>", { silent = true })
      map("n", "<leader>sk", ":Spotify prev<CR>", { silent = true })
      map("n", "<leader>sc", ":Spotify status<CR>", { silent = true })
    end,
    config = function()
      require("spotify").setup({
        notification = {
          extra_opts = {
            icon = "",
          },
        },
      })
    end,
  },
}
