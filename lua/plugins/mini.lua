return {
	{
		"echasnovski/mini.cursorword",
		event = "BufReadPre",
		config = true
	},

	{
		"echasnovski/mini.bufremove",
		event = "BufReadPre",
		opts = { silent = true },
	},

	{
		"echasnovski/mini.trailspace",
		event = "BufReadPre",
		config = true
	},

	{
		"echasnovski/mini.move",
		event = "BufReadPre",
		config = true,
	},

	{
		"echasnovski/mini.statusline",
		event = "UIEnter",
		config = true,
	},

	{
		"echasnovski/mini.pairs",
		event = "BufReadPre",
		config = true,
	},
}
