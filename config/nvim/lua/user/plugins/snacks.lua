local map = vim.keymap.set
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Disable some plugins when opening a big file.
      bigfile = { enabled = true },
      -- vim.notify implementation.
      notifier = { enabled = true },
      -- Load content as quickly as possible when opening a single file.
      quickfile = { enabled = true },
      -- Smooth scrolling.
      -- scroll = { enabled = true },
      gitbrowse = {
        notify = false,
        -- Add an extra filename pattern to open just the file without the line.
        url_patterns = {
          ["github%.com"] = {
            filename = "/blob/{branch}/{file}",
          },
          ["gitlab%.com"] = {
            filename = "/-/blob/{branch}/{file}",
          },
          ["bitbucket%.org"] = {
            filename = "/src/{branch}/{file}",
          },
        },
      },
      -- Show indentation lines.
      indent = {
        indent = {
          char = "▏",
        },
        scope = {
          enabled = false,
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Create toggle mappings
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("spell", { name = "Spell" }):map("<leader>us")
          Snacks.toggle.diagnostics():map("<leader>ud")

          -- Add a :Notifications command to show the notifications history.
          vim.cmd("command! Notifications lua Snacks.notifier.show_history()")

          map("v", "<leader>go", function()
            Snacks.gitbrowse()
          end, { desc = "Git browse" })
          map("n", "<leader>go", function()
            Snacks.gitbrowse({ what = "filename" })
            -- TODO: check if we are okay to always open with the current line.
            -- Snacks.gitbrowse()
          end, { desc = "Git browse" })
        end,
      })
    end,
  },
}
