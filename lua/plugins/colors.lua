require("tokyonight").setup({
	-- use the night style
	style = "night",
	-- disable italic for functions
	styles = {
		functions = { bold = true, italic = true },
		comments = { italic = true },
		keywords = { bold = true },
		types = { italic = true, bold = true },
	},
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.hint = "#B03D23"
		colors.error = "#942222"
	end,
})

vim.cmd.colorscheme("tokyonight")
vim.cmd("hi Directory guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
