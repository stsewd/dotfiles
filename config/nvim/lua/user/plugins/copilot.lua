local map = vim.keymap.set
return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
      map("i", "<c-l>", "<Plug>(copilot-accept-word)")
    end,
  },
}
