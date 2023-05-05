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
      map("n", "<leader>so", ":Spotify show<CR>", { silent = true })
      map("n", "<leader>sc", ":Spotify status<CR>", { silent = true })
    end,
  },
}
