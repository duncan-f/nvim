local branch = { "branch", icon = { "", color = { fg = "#a6d4de" } }, "|" }

require("lualine").setup({
	options = {
		theme = "carbonfox",
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, "diff", "diagnostics" }, -- "buffers"
		lualine_c = { "filename" },
		lualine_x = {
			{
				function()
					return ""
				end,
				color = { fg = "#ff9e64" },
				cond = function()
					return true
				end,
				on_click = function()
					vim.cmd("PackUpdate")
				end,
			},
			{ "encoding", "fileformat", "filetype" },
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
