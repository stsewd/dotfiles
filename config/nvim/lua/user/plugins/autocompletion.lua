local map = vim.keymap.set
return {
  {
    "L3MON4D3/LuaSnip",
    -- Loading snippets is slow, we load the plugin only
    -- when it's needed (imported from cmp_luasnip)
    lazy = true,
    dependencies = {
      { "honza/vim-snippets" },
    },
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- Is required to start this plugin at startup.
    lazy = false,
    dependencies = {
      -- Schemas for the JSON LSP.
      { "b0o/schemastore.nvim" },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
      lspconfig.yamlls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
      -- NOTE: esbonio should be installed on each project.
      lspconfig.esbonio.setup({ capabilities = capabilities })
      -- PHP
      lspconfig.intelephense.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
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
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_init = function(client)
          -- Set up the Lua language server to use the runtime files for Neovim
          -- Taken from https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls.
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            -- The engine that Neovim uses.
            runtime = {
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files.
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          })
        end,
        settings = {
          Lua = {},
        },
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    init = function()
      -- This is the only thing that I kind of need from lspsaga.
      -- maybe we can have this built-in?
      map("n", "<leader><C-]>", ":Lspsaga peek_definition<CR>", { silent = true, desc = "Peek definition" })
    end,
    config = function()
      local saga = require("lspsaga")
      saga.setup({
        symbol_in_winbar = {
          -- TODO: can we have this enabled, but only when requested?
          enable = false,
          show_file = false,
        },
        -- This is too noisy.
        lightbulb = {
          enable = false,
          sign = false,
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- Load the first time we get into insert mode.
    -- We don't need this plugin to be loaded at startup.
    event = "InsertEnter",
    dependencies = {
      -- LSP
      { "hrsh7th/cmp-nvim-lsp" },
      -- Other sources
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "uga-rosa/cmp-dictionary" },
      -- Snippets
      { "saadparwaiz1/cmp_luasnip" },
      -- Icons
      { "onsails/lspkind-nvim" },
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        -- Icons
        formatting = {
          format = require("lspkind").cmp_format(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
        }, {
          -- These are in another group, so they are shown only
          -- if there are no matches from the previous group.
          { name = "buffer" },
          { name = "path" },
          {
            name = "dictionary",
            keyword_length = 2,
            max_item_count = 10,
          },
        }),
      })

      -- Dowlonad dictionary for cmp-dictionary.
      local data_dir = vim.fn.stdpath("data") .. "/cmp-dictionary"
      local url = "https://github.com/neoclide/coc-sources/raw/refs/heads/master/packages/word/10k.txt"
      local dictionary_path = data_dir .. "/10k.txt"
      if vim.fn.filereadable(dictionary_path) == 0 then
        vim.system({ "mkdir", "-p", data_dir }):wait()
        vim.system({ "wget", "-O", dictionary_path, url }):wait()
      end

      require("cmp_dictionary").setup({
        paths = { dictionary_path },
      })
    end,
  },
}
