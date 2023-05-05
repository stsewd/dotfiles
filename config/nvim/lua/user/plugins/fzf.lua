local map = vim.keymap.set
return {
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    init = function()
      vim.g.fzf_command_prefix = "Fz"
      vim.g.fzf_commands_expect = "alt-enter"
      vim.g.fzf_history_dir = "~/.local/share/fzf-history"
      vim.g.fzf_layout = { window = { width = 0.80, height = 0.85 } }
    end,
  },
  {
    "stsewd/fzf-checkout.vim",
    init = function()
      vim.g.fzf_checkout_use_current_buf_cwd = true
      vim.g.fzf_checkout_git_options = "--sort=-committerdate"
    end,
    config = function()
      map("n", "<leader>fg", ":FzGBranches<CR>", { silent = true })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    branch = "main",
    keys = { "<leader>f" },
    config = function()
      local history = vim.fn.stdpath("data") .. "/fzf-lua-history/"
      vim.fn.system({ "mkdir", "--parents", history })

      vim.g.fzf_colors = {
        ["fg"] = { "fg", "FzfLuaNormal" },
        ["bg"] = { "bg", "FzfLuaNormal" },
        ["fg+"] = { "fg", "FzfLuaCurrentLine" },
        ["bg+"] = { "bg", "FzfLuaCurrentLine" },
        ["info"] = { "fg", "Comment" },
        ["separator"] = { "fg", "Comment" },
        ["pointer"] = { "fg", "ErrorMsg" },
        ["marker"] = { "fg", "WarningMsg" },
        ["gutter"] = { "bg", "FzfLuaNormal" },
        ["border"] = { "fg", "FzfLuaBorder" },
      }

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
          ["--info"] = "'inline: '",
          -- History for all commands.
          ["--history"] = history .. "all",
        },
        fzf_colors = vim.g.fzf_colors,
        keymap = {
          builtin = {
            ["<C-/>"] = "toggle-help",
            ["<F2>"] = "toggle-fullscreen",
            ["<C-space>"] = "toggle-preview",
            ["<C-D>"] = "preview-page-down",
            ["<C-F>"] = "preview-page-up",
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
      map("n", "<leader>fi", function()
        fzf.files({ cwd = "~/.config/nvim/lua/user/" })
      end, { desc = "Search user config files" })
    end,
  },
}
