return {
	"folke/noice.nvim",
	event = "UIEnter",

	dependencies = {
		"stevearc/dressing.nvim",
		"muniftanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	opts = {
		presets = {
			command_palette = true,
			lsp_doc_border = true,
			bottom_search = true,
		}
	}
}
