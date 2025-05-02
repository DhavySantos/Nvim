return {
	"vague2k/huez.nvim",
	branch = "stable",
	lazy = false,

	keys = {
		{ "<leader>fc", ":Huez<cr>", mode = "n" }
	},

	dependencies = {
		"rebelot/kanagawa.nvim",
	},

	opts = {
		fallback = "habamax",
		background = "dark",
	}
}
