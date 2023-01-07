-- Shortcuts
local map = vim.keymap.set

-- Edit this file.
map("n", "<leader>l", function()
  local file = vim.api.nvim_get_runtime_file("config.lua", true)[1]
  file = io.popen("readlink -f " .. file):read()
  vim.cmd.e(file)
end)

-- tokyonight
require("tokyonight").setup({
  styles = { comments = "None" },
  sidebars = { "qf" },
  on_highlights = function(hl, c)
    hl["@punctuation.special.rst"] = { fg = c.orange, style = "bold" }

    hl.FzfLuaNormal = { fg = c.fg_dark, bg = c.bg_dark }
    hl.FzfLuaBorder = { fg = c.bg_search, bg = c.bg_dark }
  end,
})

-- Set theme
local theme = (vim.env.BACKGROUND == "light" and "solarized") or "tokyonight"
vim.cmd.colorscheme(theme)

-- nvim-notify
require("notify").setup({
  timeout = 500,
  on_open = function(win)
    vim.api.nvim_win_set_option(win, "winblend", 30)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,
})
vim.notify = require("notify")

-- auto-session
require("auto-session").setup({
  auto_session_create_enabled = false,
})

-- nvim-tree
map("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>N", ":NvimTreeFindFile<CR>", { silent = true })

require("nvim-tree").setup({
  disable_netrw = false,
  view = {
    mappings = {
      list = {
        { key = "<cr>", action = "edit_no_picker" },
        { key = "<2-LeftMouse>", action = "edit_no_picker" },
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
        default = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      },
    },
  },
})

-- nvim-bufferline
map("n", "<leader>j", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<leader>k", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "gb", ":BufferLinePick<CR>", { silent = true })

require("bufferline").setup({
  options = {
    offsets = {
      { filetype = "NvimTree", text = "Files" },
    },
  },
})

-- lualine
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

-- nvim-autopairs
require("nvim-autopairs").setup({
  map_c_h = true,
  map_cr = false,
})

-- gitsigns.nvim
local gitsigns = require("gitsigns")
gitsigns.setup({})
map("n", "[c", gitsigns.prev_hunk)
map("n", "]c", gitsigns.next_hunk)
map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>hu", gitsigns.undo_stage_hunk)
map("n", "<leader>hp", gitsigns.preview_hunk)
map("n", "<leader>hb", function()
  gitsigns.blame_line({ full = true })
end)
map("n", "<leader>td", gitsigns.toggle_deleted)

-- indent-blankline.nvim
require("indent_blankline").setup({
  char = "¦",
  filetype_exclude = { "help", "man", "", "text", "tsplayground", "rst", "markdown", "checkhealth" },
  show_trailing_blankline_indent = false,
})

-- Workaround for https://github.com/lukas-reineke/indent-blankline.nvim/issues/449.
map("n", "za", "za<cmd>IndentBlanklineRefresh<CR>")
map("n", "zR", "zR<cmd>IndentBlanklineRefresh<CR>")

-- fzf-lua
local history = vim.fn.stdpath("data") .. "/fzf-lua-history/"
vim.fn.system({ "mkdir", "--parents", history })

local fzf = require("fzf-lua")
fzf.setup({
  winopts = {
    border = "single",
    preview = {
      horizontal = "right:45%",
      title = false,
      scrollbar = false,
    },
  },
  fzf_opts = {
    -- Use defaults
    ["--layout"] = false,
    ["--boder"] = false,
    ["--no-bold"] = "",
    ["--marker"] = "+",
    ["--no-separator"] = "",
    -- History for all commands.
    ["--history"] = history .. "all",
  },
  fzf_colors = {
    ["gutter"] = { "bg", "FzfLuaNormal" },
    ["fg+"] = { "fg", "FzfLuaNormal" },
    ["bg+"] = { "fg", "FzfLuaBorder" },
    ["info"] = { "fg", "Comment" },
    ["separator"] = { "fg", "Comment" },
    ["pointer"] = { "fg", "FzfLuaNormal" },
    ["marker"] = { "fg", "WarningMsg" },
  },
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
-- map("n", "<leader>fg", fzf.git_branches)
map("n", "<leader>fh", fzf.builtin)
map("n", "<leader>f<leader>", fzf.resume)

-- nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = { "diff" },
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
})
