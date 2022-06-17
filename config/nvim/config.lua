require("notify").setup {
  timeout = 500,
  on_open = function(win)
    vim.api.nvim_win_set_option(win, "winblend", 30)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,
}
vim.notify = require "notify"

require("nvim-tree").setup {
  disable_netrw = false,
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    custom = { ".git$", ".pyc$", "__pycache__" },
  },
  renderer = {
    special_files = {},
    icons = {
      show = {
        folder_arrow = false,
      },
      glyphs = {
        default = '',
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
        },
      },
    },
  },
}

require("bufferline").setup {
  options = {
    offsets = {
      { filetype = "NvimTree", text = "Files" },
    },
  },
}

require("lualine").setup {
  options = {
    theme = "auto",
    disabled_filetypes = { "startify", "NvimTree" },
  },
  sections = {
    lualine_b = { { "FugitiveHead", icon = "" } },
    lualine_x = { "filetype" },
  },
  extensions = { "fugitive", "quickfix" },
}

require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
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
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
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
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = false,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gd",
        goto_next_usage = "]d",
        goto_previous_usage = "[d",
      },
    },
  },
  playground = { enable = true },
  query_linter = { enable = true },
}
