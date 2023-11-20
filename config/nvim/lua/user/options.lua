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
vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"

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
