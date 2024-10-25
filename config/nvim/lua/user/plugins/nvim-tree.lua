local map = vim.keymap.set
return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    init = function()
      map("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
      map("n", "<leader>N", ":NvimTreeFindFile<CR>", { silent = true })
    end,
    config = function()
      require("nvim-tree").setup({
        filters = {
          custom = { "^\\.git$", "\\.pyc$", "__pycache__" },
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
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          -- Default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- Custom mappings
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = true }
          end
          map("n", "<cr>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
          map("n", "<2-LeftMouse>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
        end,
      })
    end,
  },
}
