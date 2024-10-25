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
    -- Load the plugin only when these commands are run.
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatDebugInfo",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
    },
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
