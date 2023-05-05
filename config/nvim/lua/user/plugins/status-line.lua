local map = vim.keymap.set
return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          disabled_filetypes = { "startify", "NvimTree" },
        },
        sections = {
          lualine_b = { { "FugitiveHead", icon = "" } },
          lualine_x = { "filetype" },
        },
        extensions = { "fugitive", "quickfix" },
      })
    end,
  },
  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      map("n", "<leader>j", ":BufferLineCyclePrev<CR>", { silent = true })
      map("n", "<leader>k", ":BufferLineCycleNext<CR>", { silent = true })
      map("n", "gb", ":BufferLinePick<CR>", { silent = true })

      require("bufferline").setup({
        options = {
          offsets = {
            { filetype = "NvimTree", text = "Files" },
          },
        },
      })
    end,
  },
}
