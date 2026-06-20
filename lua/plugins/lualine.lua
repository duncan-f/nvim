local datetime = {
	"datetime",
	style = "%a. %b. %d | %H:%M",
}
local branch = { "branch", icon = { "", color = { fg = "#a6d4de" } }, "|" }
local buffers = {
	"buffers",
	show_filename_only = true, -- Shows shortened relative path when set to false.
	hide_filename_extension = false, -- Hide filename extension when set to true.
	show_modified_status = true, -- Shows indicator when the buffer is modified.

	mode = 0, -- 0: Shows buffer name
	-- 1: Shows buffer index
	-- 2: Shows buffer name + buffer index
	-- 3: Shows buffer number
	-- 4: Shows buffer name + buffer number

	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
	-- it can also be a function that returns
	-- the value of `max_length` dynamically.
	filetype_names = {
		TelescopePrompt = "Telescope",
		dashboard = "Dashboard",
		packer = "Packer",
		fzf = "FZF",
		alpha = "Alpha",
	}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

	-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
	use_mode_colors = true,

	symbols = {
		modified = " ●", -- Text to show when the buffer is modified
		alternate_file = "@", -- Text to show to identify the alternate file
		directory = "", -- Text to show when the buffer is a directory
	},
}

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
	tabline = {
		lualine_a = {},
		lualine_b = { buffers },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { datetime },
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
