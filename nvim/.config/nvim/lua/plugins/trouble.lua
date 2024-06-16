return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "open/close trouble list" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "open trouble buffer diagnostics" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "open trouble quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "open trouble location list" },
		{ "<leader>xt", "<cmd>Trouble todo<CR>", desc = "open todos in trouble" },
	},
}
