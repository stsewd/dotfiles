local map = vim.keymap.set
return {
  "github/copilot.vim",
  -- General autocompletion
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "uga-rosa/cmp-dictionary",
    config = function()
      local dict = require("cmp_dictionary")
      dict.switcher({
        spelllang = {
          -- This is from https://github.com/neoclide/coc-sources/tree/master/packages/word.
          -- TODO: make this path more portable.
          en = "/home/stsewd/dotfiles/en.10k.dict",
        },
      })
    end,
  },
  -- Snippets
  "SirVer/ultisnips",
  "honza/vim-snippets",
  "quangnguyen30192/cmp-nvim-ultisnips",

  -- LSP
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "onsails/lspkind.nvim",
  "nvimdev/lspsaga.nvim",
  "folke/neodev.nvim",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Lua formatter.
          null_ls.builtins.formatting.stylua,
          -- Python formatter.
          null_ls.builtins.formatting.black,
          -- json/yaml/js/css/html formatter.
          null_ls.builtins.formatting.prettier,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Don't show diagnostics in virtual text.
      vim.diagnostic.config({ virtual_text = false })

      -- Show border in signature help window.
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })

      -- Set diagnostic symbols.
      local signs = { Error = "✘", Warn = "▲ ", Hint = "⚑ ", Info = "»" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Start lspsaga.
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        lightbulb = {
          sign = false,
        },
      })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          -- Buffer local mappings.
          local opts = { buffer = event.buf }
          map("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
          map("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
          map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
          map("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)
          map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
          map("n", "<leader>r", "<cmd>Lspsaga rename ++project<CR>", opts)
          map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "<C-h>", vim.lsp.buf.signature_help, opts)
          map("n", "<space>cf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- Setup LSPs.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Add support for completion in neovim lua files.
      require("neodev").setup()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      lspconfig.esbonio.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-j>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end, { "i", "s" }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end, { "i", "s" }),
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "buffer" },
          { name = "ultisnips" },
          { name = "path" },
          { name = "dictionary" },
        }),
        formatting = {
          -- Show symbols next to each suggestion.
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
      -- `/` cmdline setup.
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
