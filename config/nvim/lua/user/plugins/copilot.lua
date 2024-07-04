return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup()
    end,
  },
}
