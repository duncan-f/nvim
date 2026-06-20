-- Package Manager
vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim", name = "carbonfox" },
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/folke/noice.nvim",
	"https://github.com/tpope/vim-fugitive",
	-- Treesitter (Parser highlighting)
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
		build = ":TSUpdate",
	},
	-- Telescope
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "master",
	},
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"https://github.com/folke/which-key.nvim",
	"https://github.com/mbbill/undotree",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/captbaritone/better-indent-support-for-php-with-html",
	-- Autocompletion
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-nvim-lua",
	-- Snippets
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	-- LSP
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	-- Harpoon
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
	-- Conform (Formatting)
	"https://github.com/stevearc/conform.nvim",
})
