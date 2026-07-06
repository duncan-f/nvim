require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})

vim.cmd.colorscheme("carbonfox")
vim.cmd("hi Directory guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
