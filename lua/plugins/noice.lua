return {
	"folke/noice.nvim",
	event = "UIEnter",

	dependencies = {
		"stevearc/dressing.nvim",
		"muniftanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	opts = {
		messages = {
			enabled = false
		},

		views = {
			notify = {
				replace = true
			}
		},

		lsp = {
			progress = {
				view = "notify",
				enable = true,
			}
		},

		presets = {
			command_palette = true,
			lsp_doc_border = true,
			bottom_search = true,
		}
	}
}
