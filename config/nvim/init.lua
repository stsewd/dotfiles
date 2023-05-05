-- Bootstrap plugin manager.
require("user.plugin-manager")

-- Load user options and mappings.
require("user.options")
require("user.mappings")
require("user.commands")

-- Load plugins.
require("lazy").setup("user.plugins")
