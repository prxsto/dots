return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeout = 300
	end,
	opts = {
		defaults = {
			mode = { "n", "v" },
			["<leader>b"] = { name = "+buffer" },
			["<leader>c"] = { name = "+code" }, -- Completions
			["<leader>e"] = { name = "+explorer" }, -- Neotree
			["<leader>f"] = { name = "+find" }, -- Telescope
			["<leader>h"] = { name = "+harpoon" }, -- Harpoon
			["<leader>x"] = { name = "+diagnostics" }, -- Trouble
			["<leader>q"] = { name = "+quitting" }, -- Quitting
			["<leader>w"] = { name = "+worksessions/write" }, -- Autosession
			["<leader>s"] = { name = "+split" }, -- Splits
			["<leader>m"] = { name = "+mason" }, -- Mason
			["<leader>l"] = { name = "+lazy" }, -- Lazy
			["<leader>n"] = { desc = "which_key_ignore" },
			["<leader>d"] = { name = "+dashboard" }, -- Dashboard
			["<leader>g"] = { name = "+goto" }, -- Go to
			["<leader>r"] = { name = "+rename" }, -- Rename
			["<leader>p"] = { name = "+precog" }, --Precognition
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
