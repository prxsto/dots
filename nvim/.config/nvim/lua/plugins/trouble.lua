return {
	"folke/trouble.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "open/close trouble list" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "open trouble buffer diagnostics" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "open trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "open trouble location list" },
		{ "<leader>xt", "<cmd>Trouble todo<cr>", desc = "open todos in trouble" },
	},
}
