local map = vim.keymap.set
return {
  {
    -- Close/hide/delete current buffer.
    "mhinz/vim-sayonara",
    cmd = "Sayonara",
    init = function()
      map("n", "<leader>q", ":Sayonara<CR>", { silent = true, desc = "Close current buffer" })
      map("n", "<leader>Q", ":Sayonara!<CR>", { silent = true, desc = "Close current buffer, but keep layout" })
    end,
  },
}
