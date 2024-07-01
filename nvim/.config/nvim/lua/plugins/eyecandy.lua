return {
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	{
		"smiteshp/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				},
				separator = " 󰁔 ",
			})
		end,
	},
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = {
				default_prompt = "➤ ",
				border = "rounded",
			},
			select = { backend = { "telescope", "builtin" } },
		},
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
		end,
	},
	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	render = "compact",
	-- 	config = function()
	-- 		vim.notify = require("notify")
	-- 	end,
	-- },
	{
		"declancm/cinnamon.nvim",
		config = true,
	},
}
