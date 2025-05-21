return {
	"vague2k/huez.nvim",
	branch = "stable",
	lazy = false,

	keys = {
		{ "<leader>fc", ":Huez<cr>", mode = "n" }
	},

	dependencies = {
		"mellow-theme/mellow.nvim",
		"rebelot/kanagawa.nvim",
		"dgox16/oldworld.nvim",
	},

	opts = {
		fallback = "habamax",
		background = "dark",
	}
}
