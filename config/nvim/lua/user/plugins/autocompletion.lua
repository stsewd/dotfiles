local map = vim.keymap.set
return {
  "honza/vim-snippets",
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
  },
  {
    "neoclide/coc.nvim",
    build = "yarn install --frozen-lockfile",
    init = function()
      vim.g.coc_global_extensions = {
        "coc-word",
        "coc-syntax",
        "coc-dictionary",
        "coc-snippets",
        "coc-emoji",
        "coc-json",
        "coc-yaml",
        "coc-toml",
        "coc-html",
        "coc-css",
        "coc-pyright",
        "coc-rust-analyzer",
        "coc-tsserver",
        "coc-tag",
        "coc-sumneko-lua",
        "coc-clangd",
        "coc-esbonio",
        "coc-phpls",
      }
    end,
    config = function()
      vim.o.tagfunc = "CocTagFunc"
      vim.cmd([[
        augroup CocAutocomands
          autocmd!
          " Show function signature while completing args
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
          autocmd FileType
                \ json,js,html,c,cpp,h,hh
                \ setlocal formatexpr=CocAction('formatSelected')
        augroup END
      ]])

      map("n", "K", ":call CocAction('doHover')<CR>", { silent = true, desc = "Hover" })
      map("n", "gK", "K", { desc = "Search man/help page" })

      map("i", "<CR>", function()
        if vim.fn["coc#pum#visible"]() ~= 0 and vim.fn["coc#pum#info"]()["index"] ~= -1 then
          return vim.fn["coc#pum#confirm"]()
        end
        return "<C-g>u<CR><C-r>=coc#on_enter()<CR>"
      end, { expr = true, silent = true })
      map("i", "<C-space>", "coc#refresh()", { expr = true, silent = true })
      map("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)", { silent = true })
      map("n", "<C-k>", "<Plug>(coc-diagnostic-prev)", { silent = true })
      map("n", "<C-j>", "<Plug>(coc-diagnostic-next)", { silent = true })
      map("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
      map("n", "<C-h>", ":call CocActionAsync('showSignatureHelp')<CR>", { silent = true })

      map("n", "<C-w><leader>", "<Plug>(coc-float-jump)", { silent = true })

      map("n", "<leader>cc", ":CocCommand<CR>", { silent = true })
      map("n", "<leader>cg", "<Plug>(coc-definition)", { silent = true })
      map("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", { silent = true })
      map("x", "<leader>ca", "<Plug>(coc-codeaction-selected)", { silent = true })
      map("n", "<leader>cs", "<Plug>(coc-codeaction-source)", { silent = true })
      map("n", "<leader>r", "<Plug>(coc-references)", { silent = true })
      map("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })
      map("n", "<leader>cf", "<Plug>(coc-format)", { silent = true })
      map("v", "<leader>cf", "<Plug>(coc-format-selected)", { silent = true })
      map("n", "gr", "<Plug>(coc-rename)", { silent = true })
      map("n", "qf", "<Plug>(coc-fix-current)", { silent = true })
      map("n", "<leader>cd", ":call CocAction('diagnosticToggle')<CR>", { silent = true })
    end,
  },
}
