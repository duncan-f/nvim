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

vim.cmd([[
  iabbrev NOTE:   NOTE <bs>
  iabbrev FIX:    FIX <bs>
  iabbrev FIXME:  FIXME <bs>
  iabbrev TODO:   TODO <bs>
  iabbrev HACK:   HACK <bs>
  iabbrev WARN:   WARN <bs>
]])

local set_hl = vim.api.nvim_set_hl
-- Guibg controls background; guifg controls text color
set_hl(0, "CommentNote", { fg = "#000000", bg = "#5aed00", bold = true }) -- Orange background
set_hl(0, "CommentWarn", { fg = "#000000", bg = "#FF9E3B", bold = true }) -- Orange background
set_hl(0, "CommentFix", { fg = "#FFFFFF", bg = "#E06C75", bold = true }) -- Red background
set_hl(0, "CommentTodo", { fg = "#000000", bg = "#00EEEE", bold = true }) -- Cyan background

-- texthl links the icon color to the foreground text color of your highlight groups
vim.fn.sign_define("SignNote", { text = "📝" })
vim.fn.sign_define("SignWarn", { text = "⚠️" })
vim.fn.sign_define("SignFix", { text = "🔧" })
vim.fn.sign_define("SignTodo", { text = "✅" })

local function update_todo_signs()
	local bufnr = vim.api.nvim_get_current_buf()
	-- Clear existing signs in our custom group to prevent duplicates
	vim.fn.sign_unplace("TodoSignGroup", { buffer = bufnr })

	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	for i, line in ipairs(lines) do
		local sign_name = nil

		-- Simple plain-text checks to find which sign belongs on this line number
		if line:match("%sNOTE%s") or line:match("%sNOTE$") then
			sign_name = "SignNote"
		elseif line:match("%sFIX%s") or line:match("%sFIX$") or line:match("%sFIXME%s") or line:match("%sFIXME$") then
			sign_name = "SignFix"
		elseif line:match("%sTODO%s") or line:match("%sTODO$") then
			sign_name = "SignTodo"
		elseif line:match("%sWARN%s") or line:match("%sWARN$") or line:match("%sHACK%s") or line:match("%sHACK$") then
			sign_name = "SignWarn"
		end

		-- If a keyword was found, place the sign on that line
		if sign_name then
			vim.fn.sign_place(i, "TodoSignGroup", sign_name, bufnr, { lnum = i, priority = 20 })
		end
	end
end

vim.api.nvim_create_augroup("TodoComments", { clear = true })
vim.api.nvim_create_autocmd({ "Syntax", "FileType" }, {
	group = "TodoComments",
	pattern = "*",
	callback = function()
		vim.fn.matchadd("CommentNote", [[\v\s{1}NOTE\s{1}]])
		vim.fn.matchadd("CommentFix", [[\v\s{1}(FIX|FIXME)\s{1}]])
		vim.fn.matchadd("CommentTodo", [[\v\s{1}TODO\s{1}]])
		vim.fn.matchadd("CommentWarn", [[\v\s{1}(WARN|HACK)\s{1}]])

		-- Refresh the sign column icons dynamically as you type
		update_todo_signs()
	end,
})

-- Trigger sign update on every text change
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	group = "TodoComments",
	pattern = "*",
	callback = update_todo_signs,
})
