local map = vim.keymap.set
return {
  {
    "stsewd/spotify.nvim",
    branch = "lua-bridge",
    build = ":UpdateRemotePlugins",
    cmd = "Spotify",
    init = function()
      map("n", "<leader>ss", "<cmd>Spotify play/pause<CR>", { silent = true })
      map("n", "<leader>sj", "<cmd>Spotify next<CR>", { silent = true })
      map("n", "<leader>sk", "<cmd>Spotify prev<CR>", { silent = true })
      map("n", "<leader>so", "<cmd>Spotify show<CR>", { silent = true })
      map("n", "<leader>sc", "<cmd>Spotify status<CR>", { silent = true })
    end,
    config = function()
      local spotify = require("spotify")
      spotify.setup({ timeout = 5000 })
    end,
  },
}
