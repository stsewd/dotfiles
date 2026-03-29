local map = vim.keymap.set
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        -- The usual suspects
        "html",
        "css",
        "scss", -- SASS
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "lua",
        "luadoc",
        "luap", -- Lua patterns
        "python",
        "rust",
        "c",
        "cpp",
        "make",
        "cmake",
        "bash",
        "sql",
        "vim",

        -- Config files
        "dockerfile",
        "ini",
        "json",
        "toml",
        "yaml",

        -- Treesitter
        "comment",
        "query",

        -- Markup
        "markdown",
        "markdown_inline",
        "rst",
        "vimdoc",

        -- Just in case
        "dart",
        "go",
        "ruby",
        "graphql",
        "java",
        "kotlin",
        "latex",
        "php",
        "phpdoc",
        "terraform",
        "hcl",

        -- Git
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          -- Check if the buffer is loaded
          if not vim.api.nvim_buf_is_loaded(0) then
            return
          end
          local tree, _ = vim.treesitter.get_parser(0, nil, { error = false })
          if tree then
            -- syntax highlighting, provided by Neovim
            vim.treesitter.start()
          end
        end,
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "rust", "javascript", "zig", "python" },
        callback = function()
          -- folds, provided by Neovim
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- -- indentation, provided by nvim-treesitter
          -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        move = {
          set_jumps = true,
        },
        select = {
          lookahead = true,
        },
      })
      -- Move to next/previous function/class
      map({ "n", "x", "o" }, "]m", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
      end)

      map({ "n", "x", "o" }, "]M", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end)

      map({ "n", "x", "o" }, "[m", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
      end)

      map({ "n", "x", "o" }, "[M", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end)

      -- Select text objects
      map({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      map({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      map({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      map({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)
    end,
  },
  {
    "Wansmer/sibling-swap.nvim",
    keys = { { "<leader>," }, { "<leader>." } },
    config = function()
      require("sibling-swap").setup({})
    end,
  },
}
