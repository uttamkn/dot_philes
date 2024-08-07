local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath,
})

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	---------------------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	---------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons",            enabled = true },
		},
	},

	---------------------------------------------------------------------
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	---------------------------------------------------------------------
	--auto format
	{
		"stevearc/conform.nvim",
		lazy = false,
	},

	---------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim",       opts = {} },
			{ "folke/neodev.nvim",       opts = {} },
		},
	},

	---------------------------------------------------------------------
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets", "bobrust/rust_snippets_for_luasnip" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
	},

	---------------------------------------------------------------------
	--statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	---------------------------------------------------------------------
	{
		"ryanoasis/vim-devicons",
	},

	---------------------------------------------------------------------
	--tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	---------------------------------------------------------------------
	---colorscheme
	-- { "rose-pine/nvim",  name = "rose-pine" },
	{ "EdenEast/nightfox.nvim" },

	---------------------------------------------------------------------
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

	---------------------------------------------------------------------
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},

	---------------------------------------------------------------------
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	---------------------------------------------------------------------
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		potision = "bottom",
		height = 8,
		icons = true,
	},

	---------------------------------------------------------------------
	--vimwiki
	{ "vimwiki/vimwiki" },

	---------------------------------------------------------------------
	--file manager plugin
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	---------------------------------------------------------------------
	--indent line
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	---------------------------------------------------------------------
	--surround for quotes
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},

	---------------------------------------------------------------------
}, {})
