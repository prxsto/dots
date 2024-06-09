return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = "󰊳  update",
						icon_hl = "@variable",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = "  ",
						icon_hl = "@variable",
						desc = "files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = "  dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
				},
				footer = {},
			},
			vim.keymap.set(
				"n",
				"<leader>dd",
				"<cmd>Dashboard<CR> <BAR> <cmd>Neotree toggle<CR>",
				{ desc = "dashboard" }
			),
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
