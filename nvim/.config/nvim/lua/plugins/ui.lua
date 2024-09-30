return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "main",
			styles = {
				transparency = true,
			},
		},
		init = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		version = "2.*",
		dependencies = {
			"echasnovski/mini.icons",
		},
		init = function()
			vim.o.timeout = true
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
	},
	{
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
							action = "cd ~/.dotfiles | Telescope find_files",
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
	},
}
