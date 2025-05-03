return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		main = "ibl",
		opts = {}
	},

	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		opts = {},
	},

	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {},
	},

	{
		"utilyre/barbecue.nvim",
		dependencies = { "SmiteshP/nvim-navic" },
		event = "BufReadPre",
		opts = {},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = { current_line_blame = true }
	},
}
