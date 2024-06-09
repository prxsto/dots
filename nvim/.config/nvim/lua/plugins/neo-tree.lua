return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = { "Neotree" },
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "toggle file explorer", silent = true },
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = false,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						-- '.git',
						".DS_Store",
						-- 'thumbs.db',
					},
					never_show = {},
				},
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
		})
	end,
}
