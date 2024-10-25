local map = vim.keymap.set
return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "stevearc/dressing.nvim" },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        timeout = 500,
        on_open = function(win)
          vim.api.nvim_set_option_value("winblend", 30, { win = win })
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
      })
      vim.notify = require("notify")
    end,
  },
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
      require("bufferline").setup({
        options = {
          offsets = {
            { filetype = "NvimTree", text = "Files" },
          },
        },
      })

      map("n", "<leader>j", ":BufferLineCyclePrev<CR>", { silent = true })
      map("n", "<leader>k", ":BufferLineCycleNext<CR>", { silent = true })
      map("n", "gb", ":BufferLinePick<CR>", { silent = true })
    end,
  },
}
