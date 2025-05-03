return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},

	keys = {
		{ "<leader>p", ":Neotree focus<cr>", mode = "n", silent = true },
		{ "<leader>P", ":Neotree close<cr>", mode = "n", silent = true }
	},

	opts = {
		close_if_last_window = true,
		enable_git_status = false,

		sort_function = function(a, b)
			a.ext = a.ext or "~";
			b.ext = b.ext or "~";

			if a.type ~= b.type then
				return a.type == "directory";
			end

			if a.ext ~= b.ext then
				return a.ext < b.ext;
			end

			return a.path < b.path
		end,

		filesystem = {
			filtered_items = {
				never_show = { ".git" },
				hide_gitignored = true,
				hide_dotfiles = false,
				hide_hidden = false,
			}
		}
	}
}
