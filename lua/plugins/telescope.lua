return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",

	keys = {
		{ "<leader>ff", ":Telescope find_files<cr>", mode = "n" }
	},

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},

	opts = {
		defaults = {
			ripgrep_arguments = {
				"rg", "--hidden", "--no-heading",
				"--with-filename", "--line-number",
				"--column", "--smart-case",
			}
		}
	}
}
