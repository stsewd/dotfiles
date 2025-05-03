return {
  {
    "neovim/nvim-lspconfig",
    -- Is required to start this plugin at startup.
    lazy = false,
    dependencies = {
      -- Schemas for the JSON LSP.
      { "b0o/schemastore.nvim" },
    },
    config = function()
      -- TODO: load capabilities without loading the whole plugin!
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
      lspconfig.yamlls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.bashls.setup({})
      lspconfig.marksman.setup({})
      -- NOTE: esbonio should be installed on each project.
      lspconfig.esbonio.setup({})
      -- PHP
      lspconfig.intelephense.setup({})
      lspconfig.gopls.setup({})
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })
      lspconfig.lua_ls.setup({
        on_init = function(client)
          -- Set up the Lua language server to use the runtime files for Neovim
          -- Taken from https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls.
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            local is_dotifiles = path:match("/dotfiles$")
            local has_luarc = vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc")
            if not is_dotifiles and has_luarc then
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
    "saghen/blink.cmp",
    dependencies = {
      -- Provides snippets for the snippet source
      "rafamadriz/friendly-snippets",
      {
        "Kaiser-Yang/blink-cmp-dictionary",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    -- use a release tag to download pre-built binaries
    version = "*",
    -- Load the first time we get into insert mode.
    -- We don't need this plugin to be loaded at startup.
    event = "InsertEnter",
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "enter",
        },
        completion = {
          documentation = { auto_show = true, auto_show_delay_ms = 50 },
          menu = {
            draw = {
              columns = {
                { "label", "label_description", gap = 1 },
                { "kind_icon", gap = 1, "kind" },
              },
            },
          },
        },
        sources = {
          -- Add 'dictionary' to the list
          default = { "lsp", "path", "snippets", "buffer", "dictionary" },
          -- default = { "lsp", "path", "snippets", "buffer" },
          -- -- Dowlonad dictionary for cmp-dictionary.
          -- local data_dir = vim.fn.stdpath("data") .. "/cmp-dictionary"
          -- local url = "https://github.com/neoclide/coc-sources/raw/refs/heads/master/packages/word/10k.txt"
          -- local dictionary_path = data_dir .. "/10k.txt"
          -- if vim.fn.filereadable(dictionary_path) == 0 then
          --   vim.system({ "mkdir", "-p", data_dir }):wait()
          --   vim.system({ "wget", "-O", dictionary_path, url }):wait()
          -- end

          providers = {
            dictionary = {
              module = "blink-cmp-dictionary",
              name = "Dict",
              -- Make sure this is at least 2.
              -- 3 is recommended
              min_keyword_length = 2,
              max_items = 10,
              opts = {
                -- options for blink-cmp-dictionary
                dictionary_files = { vim.fn.stdpath("data") .. "/cmp-dictionary/10k.txt" },
                get_documentation = function(item)
                  return nil
                end
              },
            },
          },
        },
        cmdline = {
          enabled = true,
          completion = {
            menu = { auto_show = true },
            list = {
              selection = {
                preselect = false,
              },
            },
          },
        },
      })
    end,
  },
}
