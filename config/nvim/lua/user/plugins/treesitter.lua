return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
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
          "jsonc",
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
        },
        highlight = {
          enable = true,
          disable = {},
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    keys = { { "grnn" }, { "gd" } },
    config = function()
      require("nvim-treesitter.configs").setup({
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = false,
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grnn",
            },
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gd",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ia"] = "@parameter.inner",
              ["aa"] = "@parameter.outer",
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",
            },
          },
          move = {
            enable = true,
            -- These are slow in big files, hmmm.
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
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
