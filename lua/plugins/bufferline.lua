local neotree_offset = {
	text = "File Explorer",
	text_aling = "center",
	filetype = "neo-tree",
};

return {
	"akinsho/bufferline.nvim",
	event = "UIEnter",

	opts = {
		options = {
			show_buffer_close_icons = false,
			offsets = { neotree_offset },
			show_close_icon = false,
		}
	}
}
