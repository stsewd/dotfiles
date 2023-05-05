local map = vim.keymap.set
return {
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
}
