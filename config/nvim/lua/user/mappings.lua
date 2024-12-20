local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>w", ":update<CR>", { silent = true, desc = "Save file" })
map("n", "<leader>e", ":e<CR>", { silent = true, desc = "Refresh" })
map("n", "<leader>hh", ":hide<CR>", { silent = true, desc = "Hide window" })

-- Copy/cut/paste to/from clipboard
map("", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("", "<leader>Y", '"+y$', { desc = "Copy to clipboard" })
map("", "<leader>d", '"+d', { desc = "Cut to clipboard" })
map("", "<leader>D", '"+D', { desc = "Cut to clipboard" })
map("", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("", "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- Scroll
map("n", "<up>", "<C-y>", { desc = "Scroll up" })
map("n", "<down>", "<C-e>", { desc = "Scroll down" })
map("n", "<left>", "zh", { desc = "Scroll left" })
map("n", "<right>", "zl", { desc = "Scroll right" })

-- Terminal mode mappings
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode with escape" })
map("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode with escape" })
map("t", "<A-[>", "<Esc>", { desc = "Send escape to the terminal" })

-- vim-unimpaired like mappings
map("n", "yos", ":set spell! | set spell?<CR>", { desc = "Toggle spell checking" })
map("n", "yow", ":set wrap! | set wrap?<CR>", { desc = "Toggle wrap" })

map("n", "[<space>", "m`O<ESC>``", { desc = "Add a blank line above" })
map("n", "]<space>", "m`o<ESC>``", { desc = "Add a blank line below" })

map("n", "[n", function()
  require("user.utils").goto_git_conflict(true)
end, { desc = "Previous git conflict" })
map("n", "]n", function()
  require("user.utils").goto_git_conflict()
end, { desc = "Next git conflict" })

map("n", "[f", function()
  require("user.utils").goto_file_entry(true)
end, { desc = "Previous file" })
map("n", "]f", function()
  require("user.utils").goto_file_entry()
end, { desc = "Next file" })

-- Others
map(
  "n",
  "<leader>o",
  [[:let @" = expand('%:p') .. ':' .. line('.') <bar> echo @"<CR>]],
  { silent = true, desc = "Copy current path with line number" }
)
