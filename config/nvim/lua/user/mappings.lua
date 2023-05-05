local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>w", ":update<CR>", { desc = "Save file" })
map("n", "<leader>e", ":e!<CR>", { desc = "Refresh" })
map("n", "<leader>i", ":e $MYVIMRC<CR>", { desc = "Edit init.lua" })

-- Copy/cut/paste to/from clipboard
map("", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("", "<leader>d", '"+d', { desc = "Cut to clipboard" })
map("", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("", "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- Scroll
map("n", "<up>", "<C-y>", { desc = "Scroll up" })
map("n", "<down>", "<C-e>", { desc = "Scroll down" })
map("n", "<left>", "zh", { desc = "Scroll left" })
map("n", "<right>", "zl", { desc = "Scroll right" })

-- Search
map("n", "*", "*``", { desc = "Search word under cursor without moving the cursor" })
map("n", "#", "#``", { desc = "Search word under cursor without moving the cursor" })

-- Terminal mode mappings
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode with escape" })
map("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode with escape" })
map("t", "<A-[>", "<Esc>", { desc = "Send escape to the terminal" })

-- Copy current path with line number
map("n", "<leader>o", [[:let @" = expand('%:p') . ':' . line('.') <bar> echo @"<CR>]], { silent = true })
