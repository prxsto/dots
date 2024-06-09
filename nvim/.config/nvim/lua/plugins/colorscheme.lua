return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
			light_style = "day",
			transparent = true,
			terminal_colors = true,
		})
	end,
	init = function()
		vim.cmd("colorscheme tokyonight-moon")
	end,
}
