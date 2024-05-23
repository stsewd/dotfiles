-- Bootstrap plugin manager.
require("user.plugin-manager")

-- Load user options and mappings.
require("user.options")
require("user.mappings")
require("user.commands")

-- Load plugins.
require("lazy").setup("user.plugins", {
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      -- Lazy ignores the site directory by default,
      -- but we need it to load spell files.
      -- Workaround for https://github.com/folke/lazy.nvim/issues/677.
      paths = { vim.fn.stdpath("data") .. "/site" },
      disabled_plugins = {
        "netrwPlugin",
        "tutor",
        "gzip",
        "tarPlugin",
        "zipPlugin",
      },
    },
  },
})
