local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>w", "<cmd>update<CR>", { silent = true, desc = "Save file" })
map("n", "<leader>e", "<cmd>e<CR>", { silent = true, desc = "Refresh" })
map("n", "<leader>hh", "<cmd>hide<CR>", { silent = true, desc = "Hide window" })

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

-- Copy current path with line number
map("n", "<leader>o", [[:let @" = expand('%:p') . ':' . line('.') <bar> echo @"<CR>]], { silent = true })

map("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next diagnostic" })
map("n", "<C-k>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Jump to previous diagnostic" })
