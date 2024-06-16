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
	-- {
	-- 	"HiPhish/rainbow-delimiters.nvim",
	-- },
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
			input = { default_prompt = "➤ " },
			select = { backend = { "telescope", "builtin" } },
		},
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup({
				-- KEYMAPS:
				default_keymaps = true, -- Create default keymaps.
				extra_keymaps = false, -- Create extra keymaps.
				extended_keymaps = false, -- Create extended keymaps.
				override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

				-- OPTIONS:
				always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
				centered = true, -- Keep cursor centered in window when using window scrolling.
				disabled = false, -- Disables the plugin.
				default_delay = 7, -- The default delay (in ms) between each line when scrolling.
				hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
				horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
				max_length = -1, -- Maximum length (in ms) of a command. The line delay will be
				-- re-calculated. Setting to -1 will disable this option.
				scroll_limit = 150, -- Max number of lines moved before scrolling is skipped. Setting
				-- to -1 will disable this option.
			})
		end,
	},
}
