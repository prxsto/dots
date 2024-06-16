return {
	{
		"otavioschwanck/arrow.nvim",
		opts = {
			show_icons = true,
			leader_key = ";", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<cr>"),
		vim.keymap.set("n", "C-j", ":TmuxNavigateDown<cr>"),
		vim.keymap.set("n", "C-k", ":TmuxNavigateUp<cr>"),
		vim.keymap.set("n", "C-l", ":TmuxNavigateRight<cr>"),
	},
	{
		"tris203/precognition.nvim",
		config = {
			startVisible = false,
			showBlankVirtLine = false,
			hints = {
				Caret = { text = "^", prio = 1 },
				Dollar = { text = "$", prio = 1 },
				w = { text = "w", prio = 10 },
				b = { text = "b", prio = 10 },
				e = { text = "e", prio = 10 },
			},
			gutterHints = {
				--prio is not currently used for gutter hints
				G = { text = "G", prio = 1 },
				gg = { text = "gg", prio = 1 },
				PrevParagraph = { text = "{", prio = 1 },
				NextParagraph = { text = "}", prio = 1 },
			},
		},
	},
}
