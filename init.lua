require("vim._core.ui2").enable()

-- config
require("config.options")
require("config.keybinds")
require("config.autocmds")
require("config.commands")
require("config.pack")

-- plugins
require("plugins.colors")
require("plugins.highlight")
require("plugins.nvim-ts-autotag")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.harpoon")
require("plugins.conform")
require("plugins.noice")
require("plugins.lsp")
