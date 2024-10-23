-- General
vim.o.title = true
vim.o.mouse = "a"
vim.o.updatetime = 100
vim.o.showmode = false
vim.o.pumblend = 30
vim.o.swapfile = false
vim.o.colorcolumn = "100"
vim.o.scrolloff = 3
vim.opt.diffopt:append("vertical")
vim.opt.spelllang = { "en", "es" }
vim.o.termguicolors = true

-- Python provider
vim.g.python3_host_prog = vim.env.NVIM_PYTHON_HOST

-- Lines
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldnestmax = 3
vim.o.foldlevel = 1
vim.o.foldtext = ""

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.expandtab = true

-- Search & replace
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true

-- Use rg for :grep
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

-- Set up diagnostics.
-- TODO: play with these icons.
-- local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
vim.diagnostic.config({
  -- Don't show virtual text.
  virtual_text = false,
  -- Use a round border without a header for the floating window.
  float = {
    header = "",
    prefix = { "• ", "FloatBorder" },
    border = "rounded",
  },
  -- Use custom signs.
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

-- Override the default LSP floating preview window to use rounded borders.
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
