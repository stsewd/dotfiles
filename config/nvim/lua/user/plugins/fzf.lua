local map = vim.keymap.set
return {
  {
    "stsewd/fzf-lua-checkout.nvim",
    keys = {
      {
        "<leader>fg",
        function()
          require("fzf-lua-checkout.list").branches()
        end,
        desc = "List git branches",
      },
      {
        "<leader>fG",
        function()
          require("fzf-lua-checkout.list").tags()
        end,
        desc = "List git tags",
      },
    },
    config = function()
      require("fzf-lua-checkout").setup()
    end,
  },
  {
    "ibhagwan/fzf-lua",
    branch = "main",
    keys = { "<leader>f" },
    cmd = { "FzfLua" },
    config = function()
      local history = vim.fn.stdpath("data") .. "/fzf-lua-history/"
      vim.fn.system({ "mkdir", "--parents", history })

      local fzf = require("fzf-lua")
      fzf.setup({
        winopts = {
          border = "single",
          preview = {
            horizontal = "right:45%",
            layout = "horizontal",
            scrollbar = false,
          },
        },
        fzf_opts = {
          ["--layout"] = "default",
          ["--no-bold"] = "",
          ["--pointer"] = "",
          ["--marker"] = "+",
          ["--prompt"] = " ",
          ["--no-separator"] = "",
          ["--info"] = "inline: ",
          -- History for all commands.
          ["--history"] = history .. "all",
        },
        keymap = {
          builtin = {
            ["<C-/>"] = "toggle-help",
            ["<F2>"] = "toggle-fullscreen",
            ["<F3>"] = "toggle-preview-wrap",
            ["<C-space>"] = "toggle-preview",
            ["<down>"] = "preview-page-down",
            ["<up>"] = "preview-page-up",
          },
        },
        previewers = {
          builtin = {
            extensions = {
              ["png"] = { "chafa" },
              ["svg"] = { "chafa" },
              ["jpg"] = { "chafa" },
            },
          },
        },
        files = {
          prompt = "   ",
          git_icons = false,
          fzf_opts = {
            ["--history"] = history .. "files",
          },
        },
        git = {
          branches = {
            fzf_opts = {
              ["--history"] = history .. "git_branches",
            },
          },
          status = {
            fzf_opts = {
              ["--history"] = history .. "files",
            },
          },
        },
        grep = {
          git_icons = false,
          fzf_opts = {
            ["--history"] = history .. "grep",
          },
        },
      })

      map("n", "<leader>ff", fzf.files)
      map("n", "<leader>fr", function()
        fzf.grep({ search = "" })
      end)
      map("n", "<leader>fR", fzf.grep_project)
      map("n", "<leader>fl", fzf.blines)
      map("n", "<leader>fo", fzf.buffers)
      map("n", "<leader>fs", fzf.git_status)
      map("n", "<leader>fh", fzf.builtin)
      map("n", "<leader>f<leader>", fzf.resume)
    end,
  },
}
