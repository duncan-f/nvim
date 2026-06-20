vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})

-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = lsp_fmt_group,
	callback = function(args)
		-- vim.lsp.buf.format({ async = true })
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Clear tex files builds
vim.api.nvim_create_autocmd({ "VimLeave" }, { pattern = "*.tex", command = "!texclear %" })

-- Ensure of filetype when a new/read file is opened
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.tex", command = "set filetype=tex" })

-- source config files when saving
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*bashrc,*zshrc", command = "!source %" })
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*Xresources,*Xdefaults", command = "!xrdb %" })
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "files,directories", command = "!shortcuts" })

-- Delete trailing spaces when saving files
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})
