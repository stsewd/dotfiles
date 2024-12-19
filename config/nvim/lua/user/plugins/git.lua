local map = vim.keymap.set
return {
  {
    -- Show git diff on the numbers column
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({})
      map("n", "[c", gitsigns.prev_hunk)
      map("n", "]c", gitsigns.next_hunk)
      map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
      map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
      map("n", "<leader>hu", gitsigns.undo_stage_hunk)
      map("n", "<leader>hp", gitsigns.preview_hunk)
      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end)
      map("n", "<leader>td", gitsigns.toggle_deleted)
    end,
  },
  {
    -- Git wrapper
    "tpope/vim-fugitive",
    config = function()
      map("n", "<leader>gs", ":Git<CR>", { silent = true })
      map("n", "<leader>ga", ":Gwrite<CR>", { silent = true })
      map("n", "<leader>gu", ":Gread<CR>", { silent = true })
      map("n", "<leader>gc", ":Git commit<CR>", { silent = true })
    end,
  },
  {
    -- Asynchronously Git wrapper
    "lambdalisue/gina.vim",
    config = function()
      map("", "<leader>go", ":Gina browse :<CR>")
      map("n", "<leader>gO", ":Gina browse<CR>")
      map("n", "<leader>gp", ":Gina push<CR>")
      map("n", "<leader>gP", ":Gina pull<CR>")
    end,
  },
}
