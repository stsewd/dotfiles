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

map("n", "<leader>gp", function()
  require("user.utils").system({ "git", "push" }, { title = "Git push", id = "git-push" })
end, { desc = "Git push" })
map("n", "<leader>gP", function()
  require("user.utils").system({ "git", "pull" }, { title = "Git pull", id = "git-pull" })
end, { desc = "Git pull" })

-- Others
map("n", "<leader>o", function()
  local file_and_line = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("@", file_and_line)
  vim.notify("Copied " .. file_and_line)
end, { desc = "Copy current path with line number" })
