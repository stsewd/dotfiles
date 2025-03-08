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
      input = { enabled = true },
      -- Display images when opening an image file, or in markdown files.
      image = {
        enabled = true,
        doc = {
          inline = false,
          float = false,
        },
      },
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
      picker = {
        win = {
          input = {
            keys = {
              ["<c-p>"] = { "history_back", mode = { "i", "n" } },
              ["<c-n>"] = { "history_forward", mode = { "i", "n" } },
            },
          },
        },
      },
      styles = {
        input = {
          relative = "cursor",
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
          vim.cmd("command! Notifications lua Snacks.picker.notifications()")

          map("v", "<leader>go", function()
            Snacks.gitbrowse()
          end, { desc = "Git browse" })
          map("n", "<leader>go", function()
            Snacks.gitbrowse({ what = "filename" })
            -- TODO: check if we are okay to always open with the current line.
            -- Snacks.gitbrowse()
          end, { desc = "Git browse" })

          map("n", "gK", function()
            Snacks.image.hover()
          end, { desc = "Show image" })

          -- Picker mappings
          map("n", "<leader>fh", function()
            Snacks.picker.pickers()
          end, { desc = "Builtin" })
          map("n", "<leader>f<space>", function()
            Snacks.picker.resume()
          end, { desc = "Resume" })

          -- File picker mappings
          map("n", "<leader>ff", function()
            Snacks.picker.files({ hidden = true })
          end, { desc = "Files" })
          map("n", "<leader>fo", function()
            Snacks.picker.buffers()
          end, { desc = "Buffers" })
          map("n", "<leader>ft", function()
            Snacks.picker.smart({ hidden = true })
          end, { desc = "Files" })
          map("n", "<leader>fl", function()
            Snacks.picker.lines()
          end, { desc = "Buffer lines" })

          -- Grep picker mappings
          map("n", "<leader>fr", function()
            Snacks.picker.grep({ hidden = true })
          end, { desc = "Grep" })
          map("n", "<leader>fw", function()
            Snacks.picker.grep_word({ hidden = true })
          end, { desc = "Grep" })
          map("n", "<leader>fR", function()
            Snacks.picker.grep({ need_search = false, live = false, hidden = true })
          end, { desc = "Grep all files" })

          -- Git picker mappings
          map("n", "<leader>fs", function()
            Snacks.picker.git_status()
          end, { desc = "Git status" })

          -- LSP picker mappings
          map("n", "<leader>fd", function()
            Snacks.picker.diagnostics_buffer()
          end, { desc = "Buffer diagnostics" })
          map("n", "<leader>fD", function()
            Snacks.picker.diagnostics()
          end, { desc = "Diagnostics" })
          map("n", "g<c-]>", function()
            Snacks.picker.lsp_definitions()
          end, { desc = "Definitions" })
          map("n", "grr", function()
            Snacks.picker.lsp_references()
          end, { desc = "References" })

          -- Plugin picker mappings
          map("n", "<leader>fp", function()
            Snacks.picker.lazy()
          end, { desc = "Plugins" })
        end,
      })
    end,
  },
}
