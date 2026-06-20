local treesitter = require("nvim-treesitter")

local ensure_installed = {
	"json",
	"query",
	"javascript",
	"typescript",
	"tsx",
	"php",
	"yaml",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"vim",
	"vimdoc",
	"c",
	"dockerfile",
	"gitignore",
	"astro",
}

treesitter.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	-- autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = ensure_installed,
	-- auto install above language parsers
	auto_install = true,
})

treesitter.install(ensure_installed)
