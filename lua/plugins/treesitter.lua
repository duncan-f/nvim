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

local config = require("nvim-treesitter.config")

local already_installed = config.get_installed()
local parsers_to_install = {}

for _, parser in ipairs(ensure_installed) do
	if not vim.tbl_contains(already_installed, parser) then
		table.insert(parsers_to_install, parser)
	end
end

if #parsers_to_install > 0 then
	treesitter.install(parsers_to_install)
end

local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(args)
		if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
			vim.treesitter.start(args.buf)
		end
	end,
})
